class Background {

  float h = height / 10, w = height / 10;
  void draw() {
    fill(32, 32, 32, 40);
    rect(0, 0, width, height);
    for (float y = 0; y <= height; y += h) {
      for (float x = 0; x <= width; x += w) {
        fill(255, 0, 0, 10);
        noStroke();
        quad(x, y + h / 2.0, x + w / 2.0, y, x + w, y + h / 2.0, x + w / 2.0, y + h); 
      }
    }
  }
}