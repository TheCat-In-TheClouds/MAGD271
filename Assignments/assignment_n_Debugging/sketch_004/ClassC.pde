class ClassC {
  float x, y, w, h;

  ClassB(float x, float y, float w, float h) {
    x = x;
    y = y;
    w = w;
    h = h;
  }

  void draw() {
    fill(0, 0, 200, 200);
    ellipse(x, y, w, h);
  }
}