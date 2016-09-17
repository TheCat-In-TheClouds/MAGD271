PImage berlin;

void setup() {
  size(680, 420);
  berlin = loadImage("berlin.png");
}

void draw() {
  background(36);
  // 1. Calling the tint function with two arguments
  //    allows you to add alpha or transparency to the image.
  imageMode(CORNER);
  tint(255, 25);
  image(berlin, 0, 0, 62, 62);
  tint(255, 50);
  image(berlin, 62, 0, 62, 62);
  tint(255, 75);
  image(berlin, 124, 0, 62, 62);
  tint(255, 100);
  image(berlin, 186, 0, 62, 62);
  tint(255, 100);
  image(berlin, 248, 0, 62, 62);
  tint(255, 125);
  image(berlin, 310, 0, 62, 62);
  tint(255, 150);
  image(berlin, 372, 0, 62, 62);
  tint(255, 175);
  image(berlin, 434, 0, 62, 62);
  tint(255, 200);
  image(berlin, 496, 0, 62, 62);
  tint(255, 225);
  image(berlin, 558, 0, 62, 62);
  tint(255, 250);
  image(berlin, 620, 0, 62, 62);
  
  imageMode(CORNERS);
  // 2. When called with three arguments, tint treats these values
  //    as either RGB or as HSB, depending on the colorMode.
  colorMode(RGB, 255, 255, 255);
  tint(255, 127, 0);
  image(berlin, 10, 72, width / 3.0 - 10, height - 10);
  colorMode(HSB, 360, 100, 100);
  tint(149, 255, 255);
  image(berlin, width / 3.0, 72, width * 2 / 3.0 - 10, height - 10);
  colorMode(RGB, 255, 255, 255);
  tint(127, 0, 255);
  image(berlin, width * 2 / 3.0, 72, width - 10, height - 10);
}