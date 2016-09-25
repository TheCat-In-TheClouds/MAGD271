function Paddle() {
  this.scale = createVector(40, 12);
  this.stillScale = createVector(30, 12);
  this.movingScale = createVector(50, 8);
  this.pos = createVector(width / 2.0, height - this.scale.y - 5);
  this.target = createVector(width / 2.0, height - this.scale.y - 5);
  this.speed = createVector(6, 0);
  this.inactive = color(0, 127, 205);
  this.active = color(0, 127, 255);
  this.c = color(124, 124, 124);
  this.cornerRadius = 2;
  this.sluggishness = 0.05;
  this.eyeSpread = 20;
  this.leftEye = new Eye(
    createVector(this.pos.x - this.eyeSpread, this.pos.y),
    createVector(9.0, 9.0)
  );
  this.rightEye = new Eye(
    createVector(this.pos.x + this.eyeSpread, this.pos.y),
    createVector(9.0, 9.0)
  );
}

Paddle.prototype.show = function() {
  this.pos.lerp(this.target, this.sluggishness);
    this.scale.lerp(this.stillScale, this.sluggishness);
    this.c = lerpColor(this.c, this.inactive, this.sluggishness);
    fill(this.c);
    rect(this.pos.x, this.pos.y, this.scale.x, this.scale.y, this.cornerRadius);
    fill(255, 54, 27);
    arc(this.pos.x, this.pos.y, 8, 8, 0, PI, CHORD);
    this.leftEye.show(createVector(this.pos.x - this.eyeSpread, this.pos.y));
    this.rightEye.show(createVector(this.pos.x + this.eyeSpread, this.pos.y));
}

Paddle.prototype.move = function() {
  this.target.x = constrain(mouseX, this.scale.x, width - this.scale.x);
  if (mouseX - pmouseX !== 0) {
    this.scale.lerp(this.movingScale, this.sluggishness);
    this.c = lerpColor(this.c, this.active, this.sluggishness);
  }
}