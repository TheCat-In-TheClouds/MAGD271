class MappedDot {

  color currentColor;
  color targetColor;

  PVector currentPos;
  PVector originPos;
  PVector destPos;
  PVector targetPos;
  PVector scale;

  float speed;

  MappedDot(color originColor,
    PVector currentPos, 
    PVector scale, float speed, 
    float spreadFactor) {
    this.currentColor = originColor;
    this.targetColor = originColor;
    this.currentPos = currentPos.copy();

    this.originPos = new PVector(0 + (spreadFactor * scale.x), currentPos.y);
    this.destPos = new PVector(width - (spreadFactor * scale.x), currentPos.y); 

    this.targetPos = destPos.copy();
    this.scale = scale;
    this.speed = speed;
  }

  void changeColor(float value, float upperBound) {
    float r = red(this.currentColor);
    float g = green(this.currentColor);
    float b = blue(this.currentColor);

    if (r == 255) {
      b = map(value, 0, upperBound, 0, 255);
    } else if (g == 255) {
      r = map(value, 0, upperBound, 0, 255);
    } else if (b == 255) {
      g = map(value, 0, upperBound, 0, 255);
    }

    this.currentColor = lerpColor(this.currentColor, color(r, g, b), this.speed);
  }

  void moveTowards(float value, float upperBound) {
    this.currentPos = PVector.lerp(this.currentPos, 
      new PVector(map(value, 0, upperBound, this.originPos.x, destPos.x), 
      this.currentPos.y), 
      this.speed);
  }

  void draw(float value, float upperBound) {
    this.changeColor(value, upperBound);
    this.moveTowards(value, upperBound);
    noStroke();
    fill(this.currentColor);
    ellipse(this.currentPos, this.scale);
    this.measure();
  }

  void measure() {
    stroke(255);
    strokeWeight(1);
    line(PVector.add(this.originPos, new PVector(0, 20)), 
      PVector.add(this.destPos, new PVector(0, 20)));
    line(PVector.add(this.originPos, new PVector(0, 17)), 
      PVector.add(this.originPos, new PVector(0, 20)));
    line(PVector.add(this.destPos, new PVector(0, 17)), 
      PVector.add(this.destPos, new PVector(0, 20)));
  }
}