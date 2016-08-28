float verticalScalar = 3.0;

class Brick {
  PVector currentPos;
  PVector targetPos;
  PVector scale;

  int row;
  int col;

  float cornerRadius;
  float fallIntoPlaceRate;
  color c;
  
  boolean toBeRemoved;

  Brick(int row, int col, color c) {
    this.row = row;
    this.col = col;
    this.scale = new PVector(width/float(brickRows)/2.0, height/float(brickCols)/2.0/verticalScalar);
    this.currentPos = new PVector(this.scale.x + (this.row * this.scale.x * 2), -this.scale.y);
    this.targetPos = new PVector(this.scale.x + (this.row * this.scale.x * 2), this.scale.y + (this.col * this.scale.y * 2));
    this.c = c;
    this.cornerRadius = 1.5;
    this.fallIntoPlaceRate = random(0.1, 0.5);
  }

  void show(int index) {
    this.currentPos.lerp(this.targetPos, this.fallIntoPlaceRate);
    fill(this.c);
    rect(this.currentPos, this.scale, this.cornerRadius);
    if(this.toBeRemoved) {
      this.scale.lerp(new PVector(), this.fallIntoPlaceRate);
      if(this.scale.x <= 1) {
        bricks.remove(index);
      }
    }
  }
}