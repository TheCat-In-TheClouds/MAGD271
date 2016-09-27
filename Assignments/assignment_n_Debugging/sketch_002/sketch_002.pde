// Why doesn't ClassB work?

ClassA a;
ClassB b;

void setup() {
  size(420, 420);
  background(64);
  b = new ClassB();
}

void draw() {
  b.draw();
}