var verticalScalar = 3.0;

function Brick(row, col, c) {
  this.row = row;
  this.col = col;
  this.scale = createVector(width / float(brickRows) / 2.0, height / float(brickCols) / 2.0 / verticalScalar);
  this.currentPos = createVector(this.scale.x + (this.row * this.scale.x * 2), -this.scale.y);
  this.targetPos = createVector(this.scale.x + (this.row * this.scale.x * 2), this.scale.y + (this.col * this.scale.y * 2));
  this.c = c;
  this.cornerRadius = 1.5;
  this.fallIntoPlaceRate = random(0.1, 0.5);
  this.toBeRemoved = false;
}

Brick.prototype.show = function(index) {
  this.currentPos.lerp(this.targetPos, this.fallIntoPlaceRate);
  fill(this.c);
  rect(this.currentPos.x, this.currentPos.y, this.scale.x, this.scale.y, this.cornerRadius);
  if (this.toBeRemoved) {
    this.scale.lerp(createVector(), this.fallIntoPlaceRate);
    if (this.scale.x <= 1) {
      bricks.splice(index,1);
    }
  }
}