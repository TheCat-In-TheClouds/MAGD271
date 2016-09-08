class Actor {

  String name;
  int hpCurrent;
  int hpMax;

  float x;
  float y;
  float r;

  float xSpeed = 2;
  float ySpeed = 2;

  float xDirection = 1;
  float yDirection = 1;

  color c;

  Actor() {
    this.name = "Anonymous";
    this.hpMax = 100;
    this.hpCurrent = this.hpMax;
    this.x = width / 2.0;
    this.y = height / 2.0;
    this.r = height / 14.0;
    this.c = color(174, 221, 60);
    this.xSpeed = random(-4, 4);
    this.ySpeed = random(-4, 4);
  }

  Actor(String name) {
    this.name = name;
    this.hpMax = 100;
    this.hpCurrent = this.hpMax;
    this.x = width / 2.0;
    this.y = height / 2.0;
    this.r = height / 14.0;
    this.c = color(174, 221, 60);
    this.xSpeed = random(-4, 4);
    this.ySpeed = random(-4, 4);
  }

  Actor(String name, int hpMax) {
    this.name = name;
    this.hpMax = hpMax;
    this.hpCurrent = this.hpMax;
    this.x = width / 2.0;
    this.y = height / 2.0;
    this.r = height / 14.0;
    this.c = color(174, 221, 60);
    this.xSpeed = random(-4, 4);
    this.ySpeed = random(-4, 4);
  }

  public String toString() {
    return "Actor: " + this.name;
  }

  float hp() {
    return this.hpCurrent / float(this.hpMax);
  }

  void show() {
    fill(color(242, 60, 47));
    ellipse(this.x, this.y, this.r, this.r);
    fill(c);
    ellipse(this.x, this.y, this.r - 10, this.r - 10);
    
    fill(0, 0, 0);
    text(nf(this.hp() * 100, 3, 0), this.x - 1, this.y + 1);
    fill(255, 255, 255);
    text(nf(this.hp() * 100, 3, 0), this.x, this.y);
  }

  void move() {
    move(this.xSpeed, this.ySpeed);
  }

  void collide(Actor[] actors) {
  }

  // Since this version of move is specific to just the actor
  // class, and we don't want children or sub classes to
  // override it, we add the final keyword.
  final void move(float xSpeed, float ySpeed) {
    this.x += xSpeed * xDirection;
    this.y += ySpeed * yDirection;

    if (this.x >= width - this.r || this.x < this.r) {
      this.xDirection = -this.xDirection;
    }

    if (this.y >= height - this.r || this.y < this.r) {
      this.yDirection = -this.yDirection;
    }
  }
}