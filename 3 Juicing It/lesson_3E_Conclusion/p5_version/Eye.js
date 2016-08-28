function Eye(pos, scale) {
    this.origin = createVector(0, 0);
    this.irisEyeRatio = 0.5;
    this.irisMargin = 3;
    this.irisColor = color(255, 127, 0);
    this.pupilIrisRatio = 0.5;
    this.angle = 0.0;
    this.shutDuration = 10;
    this.openDuration = 200;
    this.scale = scale;
    this.pos = pos;
    // Will assume that by the time the iris and pupil are drawn,
    // the origin will have been translated to the eye's position.
    this.irisPos = createVector((this.scale.x * this.irisEyeRatio / 0.75) - this.irisMargin, 0);
    this.irisScale = p5.Vector.mult(this.scale, this.irisEyeRatio);
    this.pupilScale = p5.Vector.mult(this.irisScale, this.pupilIrisRatio);
}

Eye.prototype.look = function(origin, target) {
    this.angle = atan2(target.y - origin.y, target.x - origin.x);
}

Eye.prototype.show = function(pos) {
    if (frameCount % this.openDuration > this.shutDuration) {
      this.look(pos, ball.pos);
      push();
      translate(pos.x, pos.y);
      fill(255);
      ellipse(this.origin.x, this.origin.y, this.scale.x, this.scale.y);
      rotate(this.angle);
      fill(this.irisColor);
      ellipse(this.irisPos.x, this.irisPos.y, this.irisScale.x, this.irisScale.y);
      fill(0);
      ellipse(this.irisPos.x, this.irisPos.y, this.pupilScale.x, this.pupilScale.y);
      pop();
    }
}