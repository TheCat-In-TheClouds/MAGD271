// Why won't my image show?

PImage img;

void steup() {
  size(420, 420);
  background(64);
  img = loadImage("quit.png");
}

void draw() {
  background(32);
  imageMode(CORNERS);
  image(img, 10, 10, width - 10, height - 10);
}