class Paddle {
  PVector pos;
  PVector speed;
  PVector scale;
  PVector stillScale;
  PVector movingScale;
  PVector target;

  float cornerRadius;
  float sluggishness = 0.05;
  
  color c;
  color inactive = color(124);
  color active = color(255);

  Paddle() {
    this.scale = new PVector(40, 8);
    this.stillScale = new PVector(30, 8);
    this.movingScale = new PVector(50, 4);
    this.pos = new PVector(width / 2.0, height - this.scale.y - 5);
    this.target = new PVector(width / 2.0, height - this.scale.y - 5);
    this.speed = new PVector(6.0, 0);

    this.c = inactive;
    this.cornerRadius = 2;
  }

  void show() {
    this.pos.lerp(this.target, sluggishness);
    this.scale.lerp(this.stillScale, sluggishness);
    this.c = lerpColor(this.c, inactive, sluggishness);
    fill(this.c);
    rect(this.pos, this.scale, this.cornerRadius);
  }

  void move() {
    this.target.x = constrain(mouseX, this.scale.x, width - this.scale.x);
    if(mouseX - pmouseX != 0) {
      this.scale.lerp(this.movingScale, sluggishness);
      this.c = lerpColor(this.c, active, sluggishness);
    }
  }
}