class Car {
  color paint;
  PVector position;
  
  Car() {
    this.position = new PVector(width / 2.0, height / 2.0);
    this.paint = color(255, 0, 0);
  }
  
  void draw() {
    pushStyle();
    rectMode(CENTER);
    noStroke();
    fill(this.paint);
    rect(this.position.x, this.position.y - 22, 60, 20);
    rect(this.position.x, this.position.y, 120, 25);
    popStyle();
  }
}