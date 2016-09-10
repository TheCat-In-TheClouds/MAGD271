class Eye {

  PVector pos;
  PVector origin = new PVector(0.0, 0.0);
  PVector scale;

  float irisEyeRatio = 0.5;
  float irisMargin = 3;
  color irisColor = color(255, 127, 0);
  PVector irisPos;
  PVector irisScale;

  float pupilIrisRatio = 0.5;
  PVector pupilScale;

  int shutDuration = 10;
  int openDuration = 200;

  float angle = 0.0;

  Eye(PVector pos, PVector scale) {
    this.scale = scale;
    this.pos = pos;
    // Will assume that by the time the iris and pupil are drawn,
    // the origin will have been translated to the eye's position.
    this.irisPos = new PVector((this.scale.x * irisEyeRatio / 0.75) - irisMargin, 0);
    this.irisScale = PVector.mult(this.scale, irisEyeRatio);
    this.pupilScale = PVector.mult(this.irisScale, pupilIrisRatio);
  }

  void show(PVector pos) {
    if (frameCount % openDuration > shutDuration) {
      look(pos, ball.pos);
      pushMatrix();
      translate(pos);
      fill(255);
      ellipse(origin, scale);
      rotate(angle);
      fill(irisColor);
      ellipse(irisPos, irisScale);
      fill(0);
      ellipse(irisPos, pupilScale);
      popMatrix();
    }
  }

  void look(PVector origin, PVector target) {
    angle = atan2(target.y - origin.y, target.x - origin.x);
  }
}