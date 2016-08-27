function Ball() {
  this.dir = createVector(1.0, 1.0);
  this.pos = createVector(width / 2.0, height / 2.0);
  this.speed = createVector(random(0, 4.0), random(1.0, 4.0));
  this.targetScale = createVector(12, 12);
  this.currentScale = createVector(8, 8);
  this.c = color(255, 54, 54);
  this.acceleration = 1.0625;
  this.formRestorationRate = 0.1;
  this.deformationAmount = 2;
}

Ball.prototype.show = function() {
  this.currentScale.lerp(this.targetScale, this.formRestorationRate);
  fill(this.c);
  ellipse(this.pos.x, this.pos.y, this.currentScale.x, this.currentScale.y);
}

Ball.prototype.move = function() {
  this.pos.add(this.speed);
}

Ball.prototype.bounceSideWalls = function() {
  if (this.pos.x + this.currentScale.x > width || this.pos.x - this.currentScale.x <= 0) {
    this.dir.x *= -this.dir.x;
    this.speed.x *= this.dir.x;
    this.currentScale.x -= this.deformationAmount;
  }
}

Ball.prototype.hitCeiling = function() {
  if (this.pos.y - this.currentScale.y <= 0) {
    this.dir.y *= -this.dir.y;
    this.speed.y *= this.dir.y;
    this.currentScale.y -= this.deformationAmount;
  }
}

Ball.prototype.fallInPit = function() {
  if (this.pos.y + this.currentScale.y > height) {
    score = 0;

    this.pos = createVector(width / 2.0, height / 2.0);
    this.speed = createVector(random(0, 4.0), random(1.0, 4.0));
    this.c = color(255, 54, 54);
  }
}

Ball.prototype.hitPaddle = function(paddle) {
  if (this.pos.x + this.currentScale.x > paddle.pos.x - paddle.scale.x && this.pos.x - this.currentScale.x < paddle.pos.x + paddle.scale.x && this.pos.y + this.currentScale.y > paddle.pos.y - paddle.scale.y && this.pos.y - this.currentScale.y < paddle.pos.y + paddle.scale.y) {
    this.dir.y *= -this.dir.y;
    this.speed.y *= this.dir.y;
    this.currentScale.y -= this.deformationAmount;
  }
}

Ball.prototype.hitBrick = function(brick) {
  if (this.pos.x + this.currentScale.x > brick.currentPos.x - brick.scale.x && this.pos.x - this.currentScale.x < brick.currentPos.x + brick.scale.x && this.pos.y + this.currentScale.y > brick.currentPos.y - brick.scale.y && this.pos.y - this.currentScale.y < brick.currentPos.y + brick.scale.y) {
    this.dir.y *= -this.dir.y;
    this.speed.y *= this.dir.y;
    this.currentScale.y -= this.deformationAmount;
    score++;
    this.c = lerpColor(this.c, color(255, 255, 0), .01);
    this.speed.mult(this.acceleration);
    brick.toBeRemoved = true;
    return true;
  }
  return false;
}