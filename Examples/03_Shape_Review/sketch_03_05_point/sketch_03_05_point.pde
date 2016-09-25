void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  stroke(255);
  strokeWeight(random(1, 2.5));
  point(random(0, width), random(0, height));
}