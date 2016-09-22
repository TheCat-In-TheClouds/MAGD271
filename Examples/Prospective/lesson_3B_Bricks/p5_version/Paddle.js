function Paddle() {
  this.scale = createVector(40, 8);
  this.stillScale = createVector(30, 8);
  this.movingScale = createVector(50, 4);
  this.pos = createVector(width / 2.0, height - this.scale.y - 5);
  this.target = createVector(width / 2.0, height - this.scale.y - 5);
  this.speed = createVector(6, 0);
  this.inactive = color(124, 124, 124);
  this.active = color(255, 255, 255);
  this.c = color(124, 124, 124);
  this.cornerRadius = 2;
  this.sluggishness = 0.05;
}

Paddle.prototype.show = function() {
  this.pos.lerp(this.target, this.sluggishness);
    this.scale.lerp(this.stillScale, this.sluggishness);
    this.c = lerpColor(this.c, this.inactive, this.sluggishness);
    fill(this.c);
    rect(this.pos.x, this.pos.y, this.scale.x, this.scale.y, this.cornerRadius);
}

Paddle.prototype.move = function() {
  this.target.x = constrain(mouseX, this.scale.x, width - this.scale.x);
  if (mouseX - pmouseX != 0) {
    this.scale.lerp(this.movingScale, this.sluggishness);
    this.c = lerpColor(this.c, this.active, this.sluggishness);
  }
}