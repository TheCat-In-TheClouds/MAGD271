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
  color inactive = color(0, 127, 205);
  color active = color(0, 127, 255);

  float eyeSpread = 20;
  Eye leftEye;
  Eye rightEye;

  Paddle() {
    this.scale = new PVector(40, 12);
    this.stillScale = new PVector(30, 12);
    this.movingScale = new PVector(50, 8);
    this.pos = new PVector(width / 2.0, height - this.scale.y - 5);
    this.target = new PVector(width / 2.0, height - this.scale.y - 5);
    this.speed = new PVector(6.0, 0);
    this.c = inactive;
    this.cornerRadius = 2;

    this.leftEye = new Eye(
      new PVector(this.pos.x - this.eyeSpread, this.pos.y), 
      new PVector(9.0, 9.0)
      );
    this.rightEye = new Eye(
      new PVector(this.pos.x + this.eyeSpread, this.pos.y), 
      new PVector(9.0, 9.0)
      );
  }

  void show() {
    this.pos.lerp(this.target, sluggishness);
    this.scale.lerp(this.stillScale, sluggishness);
    this.c = lerpColor(this.c, inactive, sluggishness);
    fill(this.c);
    rect(this.pos, this.scale, this.cornerRadius);
    fill(255, 54, 27);
    arc(this.pos.x, this.pos.y, 8, 8, 0, PI, CHORD);

    this.leftEye.show(new PVector(this.pos.x - this.eyeSpread, this.pos.y));
    this.rightEye.show(new PVector(this.pos.x + this.eyeSpread, this.pos.y));
  }

  void move() {
    this.target.x = constrain(mouseX, this.scale.x, width - this.scale.x);
    if (mouseX - pmouseX != 0) {
      this.scale.lerp(this.movingScale, sluggishness);
      this.c = lerpColor(this.c, active, sluggishness);
    }
  }
}