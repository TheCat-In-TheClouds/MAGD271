var socket;

function setup() {
    createCanvas(420, 420);
    // Prevents the right-click menu from appearing within the bounds of the canvas.
    canvas.oncontextmenu = function (e) { e.preventDefault(); };
    background(64);
    noStroke();
    noCursor();

    socket = io.connect("http://localhost:3000");
    socket.on("clientAdded", onClientAdded);
    socket.on("clientLost", onClientLost);
    socket.on("updatePins", onUpdatePins);
    socket.on("mouseMoved", onMouseMoved);

    socket.emit("newPin", { x: width / 2.0, y: height / 2.0 });

}

function draw() {
    // background(32);
}

function mouseMoved() {
    if(mouseX >= 0 && mouseX < width && mouseY >= 0 && mouseY < height) {
        socket.emit("mouseMoved", { x: mouseX, y: mouseY });
    }
}

function onClientAdded(data) {

}

function onClientLost(data) {

}

function onMouseMoved(data) {
    ellipse(data.x, data.y, 10, 10);
}

function onMouseReleased(data) {

}

function onUpdatePins(data) {
    
}
