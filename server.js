"use strict";

// libs
const http = require("http");
const Req = require("./req.js");

// start server
var server = http.createServer(function(request, response) {
    if(request.method != 'POST') return request.connection.destroy();
    var req = new Req(request, response);
    request.on('data', req.onData.bind(req));
    request.on('end', req.onEnd.bind(req));
});

server.listen(3333);
console.log("Server up: 3333");