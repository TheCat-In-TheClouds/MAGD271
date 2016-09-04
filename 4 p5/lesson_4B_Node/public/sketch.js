var socket;

var pin;
var fellows = [];
var sluggishness = 0.02;

function setup() {
    createCanvas(420, 420);
    // Prevents the right-click menu from appearing within the bounds of the canvas.
    canvas.oncontextmenu = function (e) { e.preventDefault(); };
    background(64);
    ellipseMode(RADIUS);
    noStroke();
    noCursor();
    textAlign(CENTER);

    socket = io.connect("http://localhost:3000");
    socket.on("idAssigned", onIdAssigned);
    socket.on("regulation", onRegulation);
    socket.on("disconnect", onDisconnect);

    pin = new Pin(null, width / 2.0, height / 2.0, 15);
    sluggishness = random(0.02, 0.1);
    socket.emit("initialize", { x: pin.x, y: pin.y });
}

function draw() {
    background(32);

    pin.x = pin.x + (constrain(mouseX, 0, width) - pin.x) * sluggishness;
    pin.y = pin.y + (constrain(mouseY, 0, height) - pin.y) * sluggishness;
    fill(0, 127, 255);
    ellipse(pin.x, pin.y, pin.r, pin.r);
    fill(255);
    text(pin.id, pin.x, pin.y);
    socket.emit("update", { id: pin.id, x: pin.x, y: pin.y });

    var size = fellows.length;
    for(var i = 0; i < size; ++i) {
      if(pin.id != fellows[i].id) {
        fill(255, 127, 0);
        ellipse(fellows[i].x, fellows[i].y, fellows[i].r, fellows[i].r);
        fill(255);
        text(fellows[i].id, fellows[i].x, fellows[i].y);
      }
    }
}

function onIdAssigned(data) {
  pin.id = data.id;
  console.log("The server assigned an id to this client's pin " + data.id + ".");
  socket.emit("registerMe", { id: pin.id, x: pin.x, y: pin.y });
}

function onRegulation(data) {
  // console.log("The server sent an audit.");
  var size = data.length;
  fellows = [];
  for(var i = 0; i < size; ++i) {
    if(data.id != pin.id) {
      fellows.push(new Pin(data[i].id, data[i].x, data[i].y, 10));
    }
  }
  // console.log(fellows);
}

function onDisconnect() {
  socket.emit("clientDisconnecting", {id: pin.id});
}
