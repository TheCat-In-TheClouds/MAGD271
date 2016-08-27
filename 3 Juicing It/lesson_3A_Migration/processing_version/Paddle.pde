class Paddle {
  PVector pos;
  PVector speed;
  PVector scale;

  float cornerRadius;
  color c;

  Paddle() {
    this.scale = new PVector(40, 8);
    this.pos = new PVector(width / 2.0, height - this.scale.y - 5);
    this.speed = new PVector(6.0, 0);

    this.c = color(54, 255, 54);
    this.cornerRadius = 2;
  }

  void show() {
    fill(this.c);
    rect(this.pos, this.scale, this.cornerRadius);
  }

  void move() {
    if (key == CODED) {
      if (keyCode == LEFT && this.pos.x - this.scale.x >= 0) {
        this.pos.sub(this.speed);
      }

      if (keyCode == RIGHT && this.pos.x + this.scale.x < width) {
        this.pos.add(this.speed);
      }
    } else {
      if ( (key == 'A' || key == 'a')
        && this.pos.x - this.scale.x >= 0) {
        this.pos.sub(this.speed);
      }

      if ( (key == 'D' || key == 'd')
        && this.pos.x + this.scale.x < width) {
        this.pos.add(this.speed);
      }
    }
  }
}