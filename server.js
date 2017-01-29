"use strict";

// libs
const http = require("http");

// resources
const Property = require("./resources/property");

// resource endpoints
var resources = {};
resources["/property/create"] = Property.create;
resources["/property/read"] = Property.read;
resources["/property/update"] = Property.update;
resources["/property/delete"] = Property.delete;

class Register {

    constructor(request, response) {
        this.request = request;
        this.response = response;
        this.body = '';
        this.head = {
            "Content-Type":"application.json"
        };
    }

    onData(data) {
        this.body += data;
        if (this.body.length > 1e6) this.request.connection.destroy();
    }

    onEnd() {
        var payload = JSON.parse(this.body);
        var data = {};
        var that = this;

        // kill request for resources that don't exist
        if(!resources.hasOwnProperty(payload.resource)) request.connection.destroy();

        resources[payload.resource](payload.payload, function(err, result){
            if(err) {
                data.status = "ERROR";
                data.payload = err;
            } else {
                data.status = "OK";
                data.payload = result;
            }
            that.response.writeHead(200, that.head);
            that.response.write(JSON.stringify(data));
            that.response.end();
        });
    }

}

// start server
var server = http.createServer(function(request, response) {
    if(request.method != 'POST') return request.connection.destroy();
    var register = new Register(request, response);
    request.on('data', register.onData.bind(register));
    request.on('end', register.onEnd.bind(register));
});

server.listen(3333);
console.log("Server up: 3333");