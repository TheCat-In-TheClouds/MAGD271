class Car {
  color paint;
  PVector position;
  PVector scale;
  
  Car() {
    this.position = new PVector(width / 2.0, height / 2.0);
    this.scale = new PVector(120, 25);
    this.paint = color(255, 0, 0);
  }
  
  Car(PVector pos, PVector scale, color paint) {
    this.position = pos;
    this.scale = scale;
    this.paint = paint;
  }
  
  void draw() {
    pushStyle();
    rectMode(CENTER);
    noStroke();
    fill(this.paint);
    rect(this.position.x, this.position.y - (this.scale.y * 4 / 5.0), this.scale.x / 2.0, this.scale.y * 4 / 5.0);
    rect(this.position.x, this.position.y, this.scale.x, this.scale.y);
    fill(204);
    rect(this.position.x, this.position.y - (this.scale.y * 3.2 / 5.0), this.scale.x / 2.2, this.scale.y * 3 / 5.0);
    fill(64);
    ellipse(this.position.x - this.scale.x / 3.0, this.position.y + this.scale.y - (this.scale.y * 2 / 5.0), this.scale.y * 6 / 5.0, this.scale.y * 6 / 5.0);
    ellipse(this.position.x + this.scale.x / 3.0, this.position.y + this.scale.y - (this.scale.y * 2 / 5.0), this.scale.y * 6 / 5.0, this.scale.y * 6 / 5.0);
    fill(204);
    ellipse(this.position.x - this.scale.x / 3.0, this.position.y + this.scale.y - (this.scale.y * 2 / 5.0), this.scale.y * 3 / 5.0, this.scale.y * 3 / 5.0);
    ellipse(this.position.x + this.scale.x / 3.0, this.position.y + this.scale.y - (this.scale.y * 2 / 5.0), this.scale.y * 3 / 5.0, this.scale.y * 3 / 5.0);
    popStyle();
  }
}