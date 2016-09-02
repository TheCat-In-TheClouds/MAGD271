class Pattern {

  PVector pos;

  float angle = 0.0;
  float rotationIncrement = 0.01;
  float rotationDamping = 50;

  float distribution = 400;
  float spread = 5;

  Pattern(PVector pos) {
    this.pos = pos;
  }

  Pattern(float x, float y) {
    this.pos = new PVector(x, y);
  }

  void show() {
    
    pushStyle();
    //noFill();
    for (float i = -distribution; i < distribution; i+= spread) {
      
      pushMatrix();
      translate(this.pos.x, this.pos.y);
      rotate(angle * i / rotationDamping);

      strokeWeight(1);
      stroke(
        map(i, -distribution, distribution, 75, 255), 
        map(angle % (2 * PI), 0, 2* PI, 75, 255), 
        map(i, -distribution, distribution, 255, 75), 
        map(mouseY, 0, height, 0, 154)
        );
      fill(
        map(i, -distribution, distribution, 0, 75), 
        map(angle % (2 * PI), 0, 2* PI, 0, 75), 
        map(i, -distribution, distribution, 75, 0), 
        map(mouseX, 0, width, 0, 24)
        );
      ellipse(mouseY / spread, mouseX / spread, i * 0.75, i * 0.6125);
      popMatrix();
    }
    popStyle();

    angle += rotationIncrement;
  }
}