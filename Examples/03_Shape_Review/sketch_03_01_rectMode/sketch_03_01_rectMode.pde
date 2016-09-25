void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  background(32);
  noStroke();

  rectMode(CENTER);
  fill(255, 0, 0, 127);
  rect(width * 0.5, height * 0.5, width * 0.85, height * 0.85, 15);
  
  rectMode(CORNER);
  fill(0, 255, 0, 127);
  rect(width * 0.5, height * 0.5, width * 0.45, height * 0.5, 10);
  
  rectMode(RADIUS);
  fill(0, 0, 255, 127);
  rect(width * 0.5, height * 0.5, width * 0.25, height * 0.25, 5);
  
  rectMode(CORNERS);
  fill(255, 255, 0, 127);
  rect(width * 0.5, height * 0.5, width * 0.7, height * 0.3, 5);
}