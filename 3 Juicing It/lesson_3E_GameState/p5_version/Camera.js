function Camera() {
  this.origin = createVector(0,0,0); 
  this.destin = this.origin.copy();
  this.initialDamping = random(0.001, 0.01);
  this.damping = this.initialDamping;
  this.peakDamping = random(0.5, 0.75);
  this.dampingIncr = random(0.01, 0.1);
  this.shakeStrength = 10;
}

Camera.prototype.show = function() {
  if (this.damping < this.peakDamping) {
    this.damping += this.dampingIncr;
  }

  this.origin.x += (this.destin.x - this.origin.x) * this.damping;
  this.origin.y += (this.destin.y - this.origin.y) * this.damping;
    
  camera(this.origin.x, this.origin.y);
}

Camera.prototype.pan = function(d) {
  this.damping = this.initialDamping;
  if(d != null) {
    this.destin = d.copy();
  }
}

Camera.prototype.shake = function() {
    camera(random(this.origin.x - this.shakeStrength,
                  this.origin.x + this.shakeStrength),
           random(this.origin.y - this.shakeStrength,
                  this.origin.y + this.shakeStrength));
}

Camera.prototype.restore = function() {
   this.pan(createVector(0,0));
}