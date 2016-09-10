class Ball {
  PVector pos;
  PVector speed;
  PVector scale;
  PVector dir;
  // A scalar by which a vector is multiplied.
  float acceleration = 1;

  color c;

  Ball() {
    this.dir = new PVector(1.0, 1.0);
    this.pos = new PVector(width / 2.0, height / 2.0);
    this.speed = new PVector(random(0, 4.0), random(1.0, 4.0));
    this.scale = new PVector(12, 12);
    this.c = color(255, 127, 54);
    this.acceleration = 1.125;
  }

  void show() {
    fill(this.c);
    ellipse(this.pos, this.scale);
  }

  void move() {
    this.pos.add(this.speed);
  }

  void bounceSideWalls() {
    if (this.pos.x + this.scale.x > width
      || this.pos.x - this.scale.x <= 0) {
      this.dir.x *= -this.dir.x;
      this.speed.x *= this.dir.x;
    }
  }

  void crossGoal() {
    if (this.pos.y - this.scale.y <= 0) {
      score++;

      this.dir.y *= -this.dir.y;
      this.speed.y *= this.dir.y;
      this.speed.mult(this.acceleration);
    }
  }

  void fallInPit() {
    if (this.pos.y + this.scale.y > height) {
      score = 0;

      this.pos = new PVector(width / 2.0, height / 2.0);
      this.speed = new PVector(random(0, 4.0), random(1.0, 4.0));
    }
  }

  void hitPaddle(Paddle paddle) {
    if (this.pos.x + this.scale.x > paddle.pos.x - paddle.scale.x
      && this.pos.x - this.scale.x < paddle.pos.x + paddle.scale.x
      && this.pos.y + this.scale.y > paddle.pos.y - paddle.scale.y) {
      this.dir.y *= -this.dir.y;
      this.speed.y *= this.dir.y;
    }
  }
}