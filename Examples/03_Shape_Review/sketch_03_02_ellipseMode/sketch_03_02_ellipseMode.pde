void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  background(32);
  noStroke();

  ellipseMode(CENTER);
  fill(255, 0, 0, 127);
  ellipse(width * 0.5, height * 0.5, width * 0.85, height * 0.85);
  
  ellipseMode(CORNER);
  fill(0, 255, 0, 127);
  ellipse(width * 0.5, height * 0.5, width * 0.45, height * 0.5);
  
  ellipseMode(RADIUS);
  fill(0, 0, 255, 127);
  ellipse(width * 0.5, height * 0.5, width * 0.25, height * 0.25);
  
  ellipseMode(CORNERS);
  fill(255, 255, 0, 127);
  ellipse(width * 0.5, height * 0.5, width * 0.7, height * 0.3);
}