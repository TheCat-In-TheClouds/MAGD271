class ClassA {
  float x, y, w, h;
  
  ClassA() {
    x = width / 2.0;
    y = height / 2.0;
    w = h = min(width, height) / 5.0;
  }
  
  void draw() {
    fill(0, 255, 0);
    rect(x, y, w, h);
  }
}