class Widget {

  color fillColor;
  int diameter;
  boolean isRetired;
  int retiredX;
  int retiredY;
  
  Widget(int diameter) {
    this.fillColor = color(random(0,40), random(204,255), random(50,255));
    this.diameter = (int)random(diameter,diameter*3);
  }
  
  void retire(int x, int y) {
    this.isRetired = true;
    this.retiredX = x;
    this.retiredY = y;
  }
  
  void display(int x, int y) {
    fill(fillColor);
    if(isRetired) {
      ellipse(this.retiredX + random(-3,3), this.retiredY + random(-3,3), this.diameter, this.diameter);
      fill(32);
      ellipse(this.retiredX, this.retiredY, this.diameter - 5, this.diameter - 5);
    } else {
      ellipse(x + random(-10,10), y + random(-10,10), this.diameter, this.diameter);
      fill(32);
      ellipse(x, y, this.diameter - 15, this.diameter - 15);
    }
  }
}