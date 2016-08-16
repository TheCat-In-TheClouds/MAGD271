Ball[] balls;
int size = 5;

void setup() {
  size(840, 420);
  background(32);
  noStroke();
  ellipseMode(RADIUS);
  
  balls = new Ball[size];
  for (int i = 0; i < size; ++i) {
    color c = color(random(0, 255), random(0, 255), random(0, 255));
    balls[i] = new Ball((i+1)/1000, (i+1) * 0.12, (i+1) * 0.005, (size+1-i) * 15, c);
  }
}

void draw() {
  background(32);
  for (int i = 0; i < size; ++i) {
    balls[i].show();
  }
}

void mouseDragged() {
  for (int i = 0; i < size; ++i) {
    balls[i].move(mouseX, mouseY);
  }
}