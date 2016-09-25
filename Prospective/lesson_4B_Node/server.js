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

var pins = [];

// 1000 milliseconds = 1 second.
// "Cinema is truth 24 frames-per-second" - Jean Luc-Godard
// 1000 / 1 * 1 / 24 = 42. 1000 / 30 = 33. 1000 / 60 = 17.
setInterval(regulation, 42);

console.log("Server established.");

var clientCount = 0;

function newConnection(socket) {
  socket.on("initialize", initializeMsg);
  socket.on("registerMe", registrationMsg);
  socket.on("update", updateMsg);
  socket.on("clientDisconnecting", disconnectMsg);

  function initializeMsg(data) {
    socket.emit("idAssigned", { id: socket.id });
  }

  function registrationMsg(data) {
    pins.push(data);
    console.log("the server received the client's request to have its pin data pushed onto the list.");
    console.log(data);
  }

  function updateMsg(data) {
    // console.log("the server received an update from " + data.id);
    var size = pins.length;
    for(var i = 0; i < size; ++i) {
      if(data.id == pins[i].id) {
        // console.log("the client id matches a pin id in the list");
        pins[i].x = data.x;
        pins[i].y = data.y;
        // console.log(pins[i]);
      }
    }
  }

  function disconnectMsg(data) {
    clientCount--;
    console.log("lost connection to " + data.id + ". count: " + clientCount);
    var size = pins.length;
    for(var i = size - 1; i >= 0; --i) {
      if(data.id == pins[i].id) {
        pins[i].splice(i, 1);
      }
    }
    // console.log(pins);
  }

  clientCount++;
  console.log("new connection. id: " + socket.id + " count: " + clientCount);
}

function regulation() {
  io.sockets.emit("regulation", pins);
}
