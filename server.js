var http = require("http");
var server = http.createServer(function(request, response) {
  response.writeHead(200, {"Content-Type": "application.json"});
  var data = {};
  data.status = "OK";
  data.payload = "world";
  response.write(JSON.stringify(data));
  response.end();
});
server.listen(3333);
console.log("Server up: 3333");