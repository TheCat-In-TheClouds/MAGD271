class Ball {
  float originX;
  float originY;
  float destinX;
  float destinY;
  float damping = 0.001;
  float initialDamping = 0.0001;
  float peakDamping = 0.12;
  float dampingIncr = 0.0005;
  color c;
  color highlight;
  color original;
  float r;

  Ball() {
    this.originX = this.destinX = width/2;
    this.originY = this.destinY = height/2;
  }

  Ball(float initialDamping, float peakDamping, float dampingIncr, float radius, color c) {
    this.initialDamping = initialDamping;
    this.peakDamping = peakDamping;
    this.dampingIncr = dampingIncr;
    this.r = radius;
    this.c = this.original = c;
    this.highlight = color(255, random(235,255), random(168, 204));
    this.originX = this.destinX = width/2;
    this.originY = this.destinY = height/2;
  }

  void show() {
    if (this.damping < peakDamping) {
      this.damping += this.dampingIncr;
      this.c = lerpColor(this.c, this.highlight, .02);
    } else {
      this.c = lerpColor(this.c, this.original, .02);
    }

    originX += (destinX - originX) * this.damping;
    originY += (destinY - originY) * this.damping;

    fill(c);
    ellipse(originX, originY, this.r, this.r);
  }

  void move(float x, float y) {
    this.damping = this.initialDamping;
    this.destinX = x;
    this.destinY = y;
  }
}