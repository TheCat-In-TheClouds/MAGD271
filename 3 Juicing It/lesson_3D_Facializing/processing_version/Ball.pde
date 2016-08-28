class Ball {
  PVector pos;
  PVector speed;
  PVector targetScale;
  PVector currentScale;
  PVector dir;
  float acceleration = 1;
  float formRestorationRate = 0.1;
  float deformationAmount = 4;
  color c;

  int trailSize = 5;
  Trail[] trail = new Trail[trailSize];

  Ball() {
    this.dir = new PVector(1.0, 1.0);
    this.pos = new PVector(width / 2.0, height / 2.0);
    this.speed = new PVector(random(0, 4.0), random(2.5, 4.0));
    this.targetScale = new PVector(12, 12);
    this.currentScale = new PVector(8, 8);
    this.c = color(255, 54, 54);
    this.acceleration = 1.0625;

    for (int i = 0; i < trailSize; ++i) {
      trail[i] = new Trail(this.pos);
    }
  }

  void show() {
    for (int i = 0; i < trailSize; ++i) {
      if (i == 0) {
        trail[i].move(this.pos);
      } else {
        trail[i].move(trail[i-1].origin);
      }
      trail[i].show();
    }

    this.currentScale.lerp(this.targetScale, this.formRestorationRate);
    fill(this.c);
    ellipse(this.pos, this.currentScale);
  }

  void move() {
    this.pos.add(this.speed);
  }

  void bounceSideWalls() {
    if (this.pos.x + this.currentScale.x > width
      || this.pos.x - this.currentScale.x <= 0) {
      this.dir.x *= -this.dir.x;
      this.speed.x *= this.dir.x;
      this.currentScale.x -= this.deformationAmount;
    }
  }

  void hitCeiling() {
    if (this.pos.y - this.currentScale.y <= 0) {
      this.dir.y *= -this.dir.y;
      this.speed.y *= this.dir.y;
      this.currentScale.y -= this.deformationAmount;
    }
  }

  void fallInPit() {
    if (this.pos.y + this.currentScale.y > height) {
      score = 0;

      this.pos = new PVector(width / 2.0, height / 2.0);
      this.speed = new PVector(random(0, 4.0), random(2.5, 4.0));
      this.c = color(255, 54, 54);

      for (int i = 0; i < trailSize; ++i) {
        trail[i] = new Trail(this.pos);
      }
    }
  }

  void hitPaddle(Paddle paddle) {
    if (this.pos.x + this.currentScale.x > paddle.pos.x - paddle.scale.x
      && this.pos.x - this.currentScale.x < paddle.pos.x + paddle.scale.x
      && this.pos.y + this.currentScale.y > paddle.pos.y - paddle.scale.y
      && this.pos.y - this.currentScale.y < paddle.pos.y + paddle.scale.y) {
      this.dir.y *= -this.dir.y;
      this.speed.y *= this.dir.y;
      this.currentScale.y -= this.deformationAmount;
      paddle.scale.y -= (this.deformationAmount / 3.0);
    }
  }

  boolean hitBrick(Brick brick) {
    if (this.pos.x + this.currentScale.x > brick.currentPos.x - brick.scale.x
      && this.pos.x - this.currentScale.x < brick.currentPos.x + brick.scale.x
      && this.pos.y + this.currentScale.y > brick.currentPos.y - brick.scale.y
      && this.pos.y - this.currentScale.y < brick.currentPos.y + brick.scale.y) {
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
}