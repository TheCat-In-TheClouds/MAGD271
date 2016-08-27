function Ball() {
  this.dir = createVector(1.0, 1.0);
  this.pos = createVector(width / 2.0, height / 2.0);
  this.speed = createVector(random(0, 4.0), random(1.0, 4.0));
  this.scale = createVector(12.0, 12.0);
  this.c = color(255, 127, 54);
  this.acceleration = 1.125;
}

Ball.prototype.show = function() {
  fill(this.c);
  ellipse(this.pos.x, this.pos.y, this.scale.x, this.scale.y);
}

Ball.prototype.move = function() {
  this.pos.add(this.speed);
}

Ball.prototype.bounceSideWalls = function() {
  if (this.pos.x + this.scale.x > width || this.pos.x - this.scale.x <= 0) {
    this.dir.x *= -this.dir.x;
    this.speed.x *= this.dir.x;
  }
}

Ball.prototype.crossGoal = function() {
  if (this.pos.y - this.scale.y <= 0) {
    score++;

    this.dir.y *= -this.dir.y;
    this.speed.y *= this.dir.y;
    this.speed.mult(this.acceleration);
  }
}

Ball.prototype.fallInPit = function() {
  if (this.pos.y + this.scale.y > height) {
    score = 0;

    this.pos = createVector(width / 2.0, height / 2.0);
    this.speed = createVector(random(0, 4.0), random(1.0, 4.0));
  }
}

Ball.prototype.hitPaddle = function(paddle) {
  if (this.pos.x + this.scale.x > paddle.pos.x - paddle.scale.x && this.pos.x - this.scale.x < paddle.pos.x + paddle.scale.x && this.pos.y + this.scale.y > paddle.pos.y - paddle.scale.y) {
    this.dir.y *= -this.dir.y;
    this.speed.y *= this.dir.y;
  }
}