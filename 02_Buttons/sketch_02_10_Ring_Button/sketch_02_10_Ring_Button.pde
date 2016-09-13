// Blue ring
float x2 = 210;
float y2 = 275;
float radius2 = 100;
float strokeWeight = 50;

PVector mouse;
PVector blueRingCenter = new PVector(x2, y2);

void setup() {
  size(420, 420);
  ellipseMode(RADIUS);
}

void draw() {
  background(32);

  pushStyle();
  noFill();
  strokeWeight(50);
  float d = dist(x2, y2, mouseX, mouseY);
  if (d < radius2 + (strokeWeight / 2.0) &&
    d > radius2 - (strokeWeight / 2.0)) {
    stroke(255, 255, 127);
  } else {
    stroke(127, 127, 255);
  }
  ellipse(x2, y2, radius2, radius2);  
  popStyle();

  // See https://processing.org/examples/vectormath.html .

  // 4. Vectors track both direction and magnitude, so we can 
  if (mousePressed && mouseButton == LEFT && d < radius2 + (strokeWeight / 2.0) &&
    d > radius2 - (strokeWeight / 2.0)) {
    pushStyle();
    mouse = new PVector(mouseX, mouseY);
    mouse.sub(blueRingCenter);
    mouse.normalize();
    mouse.mult(radius2);
    noStroke();
    fill(255, 127, 127);
    ellipse(x2 + mouse.x, y2 + mouse.y, strokeWeight / 2.0, strokeWeight / 2.0);
    popStyle();
  }
}