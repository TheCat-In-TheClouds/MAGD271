function Paddle() {
  this.scale = createVector(40.0, 8.0);
  this.pos = createVector(width / 2.0, height - this.scale.y - 5);
  this.speed = createVector(4.0, 0);

  this.c = color(54, 255, 54);
  this.cornerRadius = 3;
}

Paddle.prototype.show = function() {
  fill(this.c);
  rect(this.pos.x, this.pos.y, this.scale.x, this.scale.y, this.cornerRadius);
}

Paddle.prototype.move = function() {
  // A == 65
  if((keyIsDown(LEFT_ARROW) || keyIsDown(65)) && this.pos.x - this.scale.x >= 0) {
    this.pos.sub(this.speed);
  }
  
  // D == 68
  if((keyIsDown(RIGHT_ARROW) || keyIsDown(68)) && this.pos.x + this.scale.x < width) {
    this.pos.add(this.speed);
  }
}