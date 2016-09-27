// Why won't my circle show up?

ClassC c;

void setup() {
  size(420, 420);
  background(64);
}

void draw() {
  c = new ClassC(30, 30, 100, 100);
  c.x += 10;
  c.draw();
}