class ClassB {
  float x, y, w, h;
  
  ClassB() {
    x = width / 2.0;
    y = height / 2.0;
    w = h = min(width, height) / 5.0;
  }
  
  void draw() {
    fill(255, 0, 0);
    ellipse(x, y, w, h);
  }
}