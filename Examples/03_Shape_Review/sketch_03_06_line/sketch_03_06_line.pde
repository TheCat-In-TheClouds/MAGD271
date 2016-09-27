void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  background(32);
  noStroke();
  fill(255);
  ellipse(width * 0.5, height * 0.5, width * 0.75, height * 0.75);
  strokeWeight(1);
  stroke(32);
  //stroke(255, 0, 0);
  strokeCap(SQUARE);
  
  // Horizontal strokes
  line(width * 0.5 - width * 0.375, height * 0.5, width * 0.5 + width * 0.375, height * 0.5);
  strokeWeight(1.5);
  line(width * 0.5 - width * 0.375, height * 0.5125, width * 0.5 + width * 0.375, height * 0.5125);
  strokeWeight(2);
  line(width * 0.5 - width * 0.375, height * 0.525, width * 0.5 + width * 0.375, height * 0.525);
  strokeWeight(2.5);
  line(width * 0.5 - width * 0.375, height * 0.55, width * 0.5 + width * 0.375, height * 0.55);
  strokeWeight(3);
  line(width * 0.5 - width * 0.375, height * 0.6, width * 0.5 + width * 0.375, height * 0.6);
  strokeWeight(3.5);
  line(width * 0.5 - width * 0.375, height * 0.7, width * 0.5 + width * 0.375, height * 0.7);
  strokeWeight(4);
  line(width * 0.5 - width * 0.375, height * 0.82, width * 0.5 + width * 0.375, height * 0.82);
  
  strokeWeight(6);
  line(width * 0.5, height * 0.5, width * 0.5, 0);
  strokeWeight(8);
  line(width * 0.25, height * 0.5, width * 0.25, 0);
  line(width * 0.75, height * 0.5, width * 0.75, 0);
  strokeWeight(1);
  line(width * 0.375, height * 0.5, width * 0.375, 0);
  //line(width * 0.25, height * 0.5, width * 0.25, 0);
  line(width * 0.6125, height * 0.5, width * 0.6125, 0);
}