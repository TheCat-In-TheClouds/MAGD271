// A variable to store the webcam capture.
var video;

var resolution = 21;
var incr = 420 / resolution;

function setup() {
    createCanvas(420, 420);
    background(64);
    noStroke();
    
    // Assign webcam capture to the video variable.
    video = createCapture(VIDEO);
    // Hide the original video feed.
    video.hide();
    // Set the size of the video.
    video.size(420, 420);
}

function draw() {
    background(32);
    // Add a tint to the displayed video.
    // tint(64, 64, 64);
    // Display the video using p5's image function.
    //image(video, 0, 0, width, height);
    
    var deltaMouseX = mouseX - pmouseX;
    var deltaMouseY = mouseY - pmouseY;
    var diameter = map(mouseX * mouseY, 0, width * height, 5, 20);
    
    // Load pixels from the video.
    video.loadPixels();
    for (var y = incr / 2.0; y < 420; y += incr) {
        for (var x = incr / 2.0; x < 420; x += incr) {
            var i = (video.width - x + 1 + (y * video.width)) * 4;
            var r = video.pixels[i];
            var g = video.pixels[i+1];
            var b = video.pixels[i+2];
            
            r = (r + deltaMouseX) % 256;
            b = (b + deltaMouseY) % 256;
            
            fill(r, g, b);
            ellipse(x, y, diameter, diameter);
        }
    }
}