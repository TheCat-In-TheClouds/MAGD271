class Trail {
  PVector origin;
  PVector destin;
  PVector scale;

  float damping;
  float initialDamping;
  float peakDamping;
  float dampingIncr;

  Trail(PVector origin) {
    this.origin = origin.copy();
    this.destin = origin.copy();
    this.initialDamping = random(0.001, 0.01);
    this.damping = this.initialDamping;
    this.peakDamping = random(0.5, 0.95);
    this.dampingIncr = random(0.01, 0.1);
    float r = random(2, 8);
    this.scale = new PVector(r, r);
  }

  void show() {
    if (this.damping < this.peakDamping) {
      this.damping += this.dampingIncr;
    }
    
    this.origin.x += (this.destin.x - this.origin.x) * this.damping;
    this.origin.y += (this.destin.y - this.origin.y) * this.damping;
    
    pushStyle();
    strokeWeight(5);
    stroke(255, 127, 0, random(54, 204));
    noFill();
    ellipse(this.origin, this.scale);
    popStyle();
  }
  
  void move(PVector d) {
    this.damping = this.initialDamping;
    this.destin = d.copy();
  }
}