PImage seattle1;
PImage seattle2;
PImage seattle3;
PImage seattle4;
PImage seattle5;
PImage seattle6;
PImage seattle7;

void setup() {
  background(32);
  size(680, 420);
  seattle1 = loadImage("seattle.png");

  seattle2 = loadImage("seattle.png");
  seattle2.filter(GRAY);
  seattle3 = loadImage("seattle.png");
  seattle3.filter(INVERT);
  seattle4 = loadImage("seattle.png");
  seattle4.filter(POSTERIZE, 10);
  seattle5 = loadImage("seattle.png");
  seattle5.filter(BLUR, 6);
  seattle6 = loadImage("seattle.png");
  seattle6.filter(ERODE);
  seattle7 = loadImage("seattle.png");
  seattle7.filter(DILATE);
}

void draw() {
  image(seattle1, 0, 0, 97, 420);
  image(seattle2, 97, 0, 97, 420);
  image(seattle3, 194, 0, 97, 420);
  image(seattle4, 291, 0, 97, 420);
  image(seattle5, 388, 0, 97, 420);
  image(seattle6, 485, 0, 97, 420);
  image(seattle7, 582, 0, 98, 420);
}