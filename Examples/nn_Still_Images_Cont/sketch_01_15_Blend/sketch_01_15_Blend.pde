PImage a;
PImage b;

void setup() {
  frameRate(1);
  size(680, 420);
  background(255);
  noStroke();
  a = loadImage("a.png");
  b = loadImage("b.png");

  // background image
  image(b, 0, 0, width, height);

  blendMode(MULTIPLY);
  // far-left foreground image
  image(a, 0, 0, width / 4.0, height);

  blendMode(ADD);
  // middle-left foreground image
  image(a, width / 4.0, 0, width / 4.0, height);

  blendMode(SUBTRACT);
  // middle-right foreground image
  image(a, width / 2.0, 0, width / 4.0, height);

  blendMode(DARKEST);
  // far-right foreground image
  image(a, width * 3 / 4.0, 0, width / 4.0, height);
}

void draw() {
  // blendModes, when called in draw, tend to
  // be overpowering, because they are repeatedly
  // applied to various shapes.
  blendMode(MULTIPLY);

  // far-left top ellipses
  fill(255, 0, 127, 54);
  ellipse(85, 50, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(85, 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(85, 100, 75, 75);

  // middle-left bottom ellipses
  fill(255, 0, 127, 54);
  ellipse(255, height - 100, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(255, height - 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(255, height - 50, 75, 75);

  blendMode(ADD);

  // middle-left top ellipses
  fill(255, 0, 127, 54);
  ellipse(255, 50, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(255, 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(255, 100, 75, 75);

  // middle-right bottom ellipses
  fill(255, 0, 127, 54);
  ellipse(425, height - 100, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(425, height - 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(425, height - 50, 75, 75);

  blendMode(SUBTRACT);

  // middle-right top ellipses
  fill(255, 0, 127, 54);
  ellipse(425, 50, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(425, 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(425, 100, 75, 75);

  // far-right bottom ellipses
  fill(255, 0, 127, 54);
  ellipse(595, height - 100, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(595, height - 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(595, height - 50, 75, 75);

  blendMode(DARKEST);

  // far-right top ellipses
  fill(255, 0, 127, 54);
  ellipse(595, 50, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(595, 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(595, 100, 75, 75);

  // far-left bottom ellipses
  fill(255, 0, 127, 54);
  ellipse(85, height - 100, 75, 75);
  fill(127, 255, 0, 127);
  ellipse(85, height - 75, 75, 75);
  fill(0, 127, 255, 204);
  ellipse(85, height - 50, 75, 75);
}