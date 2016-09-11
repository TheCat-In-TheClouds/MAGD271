int x1 = 100;
int x2 = 300;
int y1 = 200;

void setup() {
  size(680, 420);
  background(32);
  rectMode(CORNERS);
}

void draw() {
  background(32);

  // 1. The same process that we applied to the horizontal
  //    position of the mouse relative to the rectangle can
  //    be applied to the mouse's vertical position.
  if(mouseX > x1 && mouseX < x2 && mouseY > y1) {
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  rect(x1, y1, x2, height);
}