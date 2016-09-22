function Trail(origin) {
  this.origin = origin.copy();
  this.destin = origin.copy();
  this.initialDamping = random(0.001, 0.01);
  this.damping = this.initialDamping;
  this.peakDamping = random(0.5, 0.95);
  this.dampingIncr = random(0.01, 0.1);
  var r = random(2, 8);
  this.scale = createVector(r, r);
}

Trail.prototype.show = function() {
  if (this.damping < this.peakDamping) {
    this.damping += this.dampingIncr;
  }

  this.origin.x += (this.destin.x - this.origin.x) * this.damping;
  this.origin.y += (this.destin.y - this.origin.y) * this.damping;

  push();
  strokeWeight(5);
  stroke(255, 127, 0, random(54, 204));
  noFill();
  ellipse(this.origin.x, this.origin.y, this.scale.x, this.scale.y);
  pop();
}

Trail.prototype.move = function(d) {
  this.damping = this.initialDamping;
  this.destin = d.copy();
}