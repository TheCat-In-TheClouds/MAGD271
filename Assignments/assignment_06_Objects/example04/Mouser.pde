class Mouser {
  PVector position, scale;
  color fill;
  
  Mouser() {
    position = new PVector(width / 2.0, height / 2.0);
    scale = new PVector(10, 10);
    fill = color(255);
  }
  
  void show() {
    position = new PVector(mouseX, mouseY);
    fill(fill);
    ellipse(position.x, position.y, scale.x, scale.y);
  }
  
  void keepTrack(Thumper t) {
    scale.x = scale.y = map(t.position.x, 0, width, 10, 60);
  }
}