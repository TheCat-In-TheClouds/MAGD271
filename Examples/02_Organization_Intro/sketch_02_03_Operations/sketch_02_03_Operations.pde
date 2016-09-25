// 1. These operations should be familiar. The only one
//    which is given short shrift relative to its
//    importance is the modulo % operator. This operator
//    returns the remainder which cannot be cleanly divied.
//    So 9 % 5 = 4 because 9 / 5 = 1 + 4/5 . This is useful
//    for determining whether a number is even or odd, e.g.
//    3 % 2 == 1, 4 % 2 == 0

int x1 = 210;
int y1 = 315;
int w1 = 150;
int h1 = 150;

float x2 = 350.5;
float y2 = 75.3;
float w2 = 75.0;
float h2 = 75.0;

void setup() {
  size(420, 420);
  background(64);
}

void draw() {
  background(32);
  stroke(255);
  strokeWeight(1.5);
  fill(204, 0, 0);

  x1 = x1 + 1;
  y1 = y1 - 1;
  x2 = x2 / 1.0015;
  y2 = y2 * 1.0015;

  w2 = w2 - 0.01;
  h2 = h2 + 0.1;

  ellipse(x1, y1, w1, h1);
  
  if (frameCount % 20 == 0) {
    fill(0, 204, 0);
    ellipse(x2, y2, w2, h2);
  }
}