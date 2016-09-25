void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  background(32);
  noStroke();

  fill(0, 255, 0, 127);
  triangle(width, height, width, 0, 0, height);

  fill(255, 0, 0, 127);
  triangle(0, 0, width * 0.5, height * 0.75, width, 0);

  fill(0, 0, 255, 127);
  triangle(width * 0.75, height, width * 0.5, height * 0.5, 0, height);

  fill(255, 255, 0, 127);
  triangle(0,0, width * 0.5, height * 0.33, width * 0.25, height * 0.85);
}