var express = require('express');
var socket = require('socket.io');

var app = express();
var port = 3000;
var server = app.listen(port);
// Specifies the directory which server will host.
app.use(express.static('public'));

var io = socket(server);
// A new connection being established is an event.
// We want to define a function which will be called
// when this event occurs. We will pass this function
// as an argument to the second parameter of io.sockets.on.
io.sockets.on('connection', newConnection);

console.log("Up and running.");

var clientCount = 0;

function newConnection(socket) {
  clientCount++;
  console.log("new connection. id: " + socket.id + " count: " + clientCount);
  socket.broadcast.emit("clientAdded", { count: clientCount });

  socket.on("disconnect", lostConnectionMsg);
  socket.on("newPin", newPinMsg);
  socket.on("mouseMoved", mouseMovedMsg);
    
  function lostConnectionMsg() {
    // clientCount--;
    socket.broadcast.emit("clientLost", { count: clientCount });
    console.log("lost connection. count: " + clientCount);
  }
    
  function mouseMovedMsg(data) {
    console.log("mouseMoved message received.");
    io.sockets.emit("mouseMoved", data);
  }
    
  function newPinMsg(data) {   
    io.sockets.emit("updatePins", data);
    console.log("newPin message received.");
  }
}