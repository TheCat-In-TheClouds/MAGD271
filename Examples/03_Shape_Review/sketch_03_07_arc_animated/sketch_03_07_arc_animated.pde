float theta = 0, thetaPrime = HALF_PI;

void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  background(32);
  noStroke();

  ellipseMode(CENTER);
  fill(0, 255, 0, 127);
  theta += 0.01;
  thetaPrime += 0.02;
  arc(width * 0.5, height * 0.5, width, height, theta, thetaPrime);

  fill(255, 0, 0, 127);
  arc(width * 0.5, height * 0.5, width * 0.85, height * 0.85, theta + QUARTER_PI, thetaPrime);

  fill(0, 0, 255, 127);
  arc(width * 0.5, height * 0.5, width * 0.75, height * 0.75, theta + HALF_PI, thetaPrime, CHORD);

  fill(255, 255, 0, 127);
  arc(width * 0.5, height * 0.5, width * 0.65, height * 0.65, theta + QUARTER_PI * 6, thetaPrime, CHORD);
}