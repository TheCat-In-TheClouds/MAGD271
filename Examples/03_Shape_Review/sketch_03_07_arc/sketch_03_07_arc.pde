void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  background(32);
  noStroke();

  ellipseMode(CENTER);
  fill(0, 255, 0, 127);
  arc(width * 0.5, height * 0.5, width, height, 0, HALF_PI);

  fill(255, 0, 0, 127);
  arc(width * 0.5, height * 0.5, width * 0.85, height * 0.85, QUARTER_PI, QUARTER_PI * 3);

  fill(0, 0, 255, 127);
arc(width * 0.5, height * 0.5, width * 0.75, height * 0.75, HALF_PI, QUARTER_PI * 7, CHORD);

  fill(255, 255, 0, 127);
  arc(width * 0.5, height * 0.5, width * 0.65, height * 0.65, QUARTER_PI * 6, TAU, CHORD);
}