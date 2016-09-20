// 1. This is Processing's fault.

PVector pos, scale;
float angle1 = 0;
float angle2 = QUARTER_PI;

void setup() {
  size(420, 420);
  background(64);

  pos = new PVector(0, 210);
  scale = new PVector(350, 350);
}

void draw() {
  background(32);
  noStroke();

  //    2. It's support for Vectors is not as consistent as,
  //    say, Unity's. So doing this
  // ellipse(pos.x, pos.y, scale.x, scale.y);
  // pos.add(new PVector(1, 0));

  //    3. is annoying. Especially when you could do this:
  fill(0, 0, 255, 155);
  ellipse(pos, scale);
  pos.add(VECTOR_E);

  fill(255, 0, 0, 55);
  arc(pos, scale, angle1, angle2);
  angle1 = angle1 + 0.01;
  angle2 = angle2 + 0.02;
}