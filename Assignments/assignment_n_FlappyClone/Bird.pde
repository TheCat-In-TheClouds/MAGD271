class Bird {
  color normalColor;

  float x, 
    y, 
    radius, 
    gravity = 0.6, 
    lift = 15, 
    velocity, 
    airResistance = 0.9, 
    theta = TAU, 
    flapAngle = radians(330), 
    fallAngle = radians(30);

  Bird() {
    this.x = random(width / 8.0, width / 6.0);
    this.y = height / 2.0;
    this.radius = 16;
    this.normalColor = color(0, 64, 204);
  }

  Bird(float x, float y, float r, color nc) {
    this.x = x;
    this.y = y;
    this.radius = r;
    this.normalColor = nc;
  }

  void draw() {
    pushMatrix();
    gravity();
    groundCollision();
    ceilingCollision();
    show();
    popMatrix();
  }

  void show() {
    pushStyle();
    ellipseMode(RADIUS);
    strokeWeight(1.5);
    stroke(255, 255, 0);
    //noStroke();
    translate(this.x, this.y);
    rotate(this.theta);
    fill(this.normalColor);
    ellipse(0, 0, this.radius, this.radius);
    line(0, 0, this.radius, 0);
    popStyle();
  }

  void flap() {
    this.velocity -= this.lift;
    if (mousePressed) {
      this.theta = this.flapAngle;
    }
  }

  void gravity() {
    this.velocity += this.gravity;
    this.velocity *= this.airResistance;
    this.y += velocity;
    if (!mousePressed) {
      this.theta = this.fallAngle;
    }
  }

  void ceilingCollision() {
    if (this.y < this.radius) {
      this.y = this.radius;
      this.velocity = 0;
    }
  }

  void groundCollision() {
    if (this.y > height - this.radius) {
      this.y = height  - this.radius;
      this.velocity = 0;
      sm.set("Loss");
    }
  }
}