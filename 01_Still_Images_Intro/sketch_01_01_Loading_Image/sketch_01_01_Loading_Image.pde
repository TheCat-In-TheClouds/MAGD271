// 1. In the menu bar of the sketch, go to Sketch > Add File...
// then open the image you wish to add to the sketch. Alternatively,
// drag the image file icon over the sketch window.

// 2. Declare a variable of the data type PImage.
PImage corfu;

void setup() {
  size(420, 420);
  // 2. Assign to the PImage variable the result of the function
  // loadImage(String fileName);
  corfu = loadImage("corfu.png");
}

void draw() {
  background(32);
  // 3. image(PImage img, float x, float y, float width, float height);
  image(corfu, 0, 0, 420, 420);
}