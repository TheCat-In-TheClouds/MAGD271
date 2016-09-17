int x1 = 100;
int x2 = 300;

void setup() {
  size(680, 420);
  background(32);
  noStroke();
  rectMode(CORNERS);
}

void draw() {
  background(32);

  // 1. The '&&' here is asking if it is true that mouseX is both
  //    greater than the rectangle's left side and lesser than the
  //    rectangle's right side. If the mouse is in the gray on either
  //    side of the sketch, one of these conditions is true, but the
  //    other is not.
  if (mouseX > x1 && mouseX < x2) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  rect(x1, 0, x2, height);
}