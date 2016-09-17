int x1 = 100;
int x2 = 300;
int y1 = 200;
int y2 = 250;

float cornerRounding = 5.0;

void setup() {
  size(680, 420);
  background(32);
  noStroke();
  rectMode(CORNERS);
}

void draw() {
  background(32);
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }

  // 1. There's one last optional piece of info we can add to the
  //    rectangle, which is whether or not we'd like to round its
  //    corners.
  rect(x1, y1, x2, y2, cornerRounding);
}