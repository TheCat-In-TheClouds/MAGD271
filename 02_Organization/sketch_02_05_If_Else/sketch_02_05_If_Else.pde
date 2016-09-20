boolean criterion1 = false;
boolean criterion2 = false;

float x = 100;
float y = 210;
float w = 50;
float h = 50;

int direction1 = 1;
int direction2 = 1;

void setup() {
  size(420, 680);
  background(64);
  noStroke();
}

void draw() {
  background(32);

  criterion1 = x > 300 || x < 80;
  criterion2 = y > 600 || y < 130;

  // 1. If-else blocks tell the computer to do one
  //    thing if a boolean or comparison is true, and
  //    to do another if not. The syntax is if(condition) {
  //    // code to do if true; } else { // code to do
  //    if false; }
  if (criterion1) {
    direction1 = direction1 * -1;
  }
  x = x + (1 * direction1);

  fill(255, 127, 0);
  ellipse(x, 210, w, h);

  fill(0, 255, 127);
  ellipse(210, y, w, h);

  if (criterion2) {
    direction2 = direction2 * -1;
  }
  y = y - (1.5 * direction2);
}