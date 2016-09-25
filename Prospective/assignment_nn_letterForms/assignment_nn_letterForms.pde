
void setup() {
  size(420, 420);
  noStroke();
  background(64);
}

void draw() {
  background(32);
  a(0, 0, width / 2.0, height / 2.0, color(255, 0, 0));
}

void a(float x, float y, float w, float h, color c) {
  fill(c);
  beginShape();
  vertex(x + w * 0.125, y + h);
  vertex(x + w * 0.375, y);
  vertex(x + w * 0.625, y);
  vertex(x + w * 0.875, y + h);
  vertex(x + w * 0.75, y + h);
  vertex(x+ w * 0.6455, y + h * 0.625);
  vertex(x + w * 0.354, y + h * 0.625);
  vertex(x + w * 0.25, y + h);
  beginContour();
  vertex(x + w * 0.5, y + h * 0.0625);
  vertex(x + w * 0.375, y + h * 0.5);
  vertex(x+ w * 0.625, y + h * 0.5);
  endContour();
  endShape(CLOSE);
}