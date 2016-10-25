Capsule c;

void setup() {
  size(420, 420);
  //fullScreen();
    background(0);
  c = new Capsule();
}

void draw() {
  c.show();
  c.move();
  c.interact();
}