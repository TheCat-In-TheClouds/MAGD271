PImage a;
PImage b;

void setup() {
  size(680, 420);
  background(255);
  noStroke();
  a = loadImage("a.png");
  b = loadImage("b.png");

  // Background image
  image(b, 0, 0, width, height);

  blendMode(MULTIPLY);
  // Left foreground image
  image(a, 0, 0, width / 4.0, height);

  fill(255, 0, 127, 54);
  ellipse(85, 50, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(85, 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(85, 100, 75, 75);

  fill(255, 0, 127, 54);
  ellipse(255, 125, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(255, 150, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(255, 175, 75, 75);

  blendMode(ADD);
  image(a, width / 4.0, 0, width / 4.0, height);

  fill(255, 0, 127, 54);
  ellipse(255, 50, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(255, 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(255, 100, 75, 75);

  fill(255, 0, 127, 54);
  ellipse(425, 125, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(425, 150, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(425, 175, 75, 75);

  blendMode(SUBTRACT);
  image(a, width / 2.0, 0, width / 4.0, height);

  fill(255, 0, 127, 54);
  ellipse(425, 50, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(425, 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(425, 100, 75, 75);

  fill(255, 0, 127, 54);
  ellipse(595, 125, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(595, 150, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(595, 175, 75, 75);

  blendMode(DARKEST);
  // Right foreground image
  image(a, width * 3 / 4.0, 0, width / 4.0, height);

  fill(255, 0, 127, 54);
  ellipse(595, 50, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(595, 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(595, 100, 75, 75);

  fill(255, 0, 127, 54);
  ellipse(85, 125, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(85, 150, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(85, 175, 75, 75);
}