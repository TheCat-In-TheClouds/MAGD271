PImage topImg;
PImage bottomImg;

class Pipe {
  float top, 
    bottom, 
    x, 
    w, 
    speed = 3, 
    forgiveness = 5, 
    minDifficulty = 10, 
    cornerRounding = 5;
  color fill;
  boolean struck, addedToScore;

  Pipe() {
    this.x = width;
    this.w = 48;
    this.top = random(this.minDifficulty, height / 2.0 - this.forgiveness);
    this.bottom = random(this.minDifficulty, height / 2.0 - this.forgiveness);
    this.fill = color(0, 225, 120);
  }

  Pipe(float birdRadius) {
    float birdDiameter = birdRadius * 2;
    this.x = width;
    this.w = birdDiameter * 1.5;
    this.top = random(birdDiameter + this.minDifficulty, height / 2.0 - birdDiameter - this.forgiveness);
    this.bottom = random(birdDiameter + this.minDifficulty, height / 2.0 - birdDiameter - this.forgiveness);
    this.fill = color(0, 225, 120);
  }

  Pipe(float birdRadius, float speed, float forgiveness, float minDifficulty) {
    float d = birdRadius * 2;
    this.x = width;
    this.w = d * 1.5;
    this.speed = speed;
    this.forgiveness = forgiveness;
    this.minDifficulty = minDifficulty;
    this.top = random(d + this.minDifficulty, height / 2.0 - d - this.forgiveness);
    this.bottom = random(d + this.minDifficulty, height / 2.0 - d - this.forgiveness);
    this.fill = color(0, 225, 120);
  }

  public String toString() {
    return "Speed: " + this.speed + " Forgiveness: " + this.forgiveness + " MinDifficulty: " + this.minDifficulty;
  }

  void draw() {
    this.move();
    this.show();
  }

  void move() {
    this.x -= this.speed;
  }

  void show() {
    pushStyle();
    if (topImg == null || bottomImg == null) {
      noStroke();
      fill(this.fill);
      rect(this.x, 0, this.w, this.top, 0, 0, this.cornerRounding, this.cornerRounding);
      rect(this.x, height - this.bottom, this.w, this.bottom, this.cornerRounding, this.cornerRounding, 0, 0);
    } else {
      image(bottomImg, this.x, height - this.bottom, this.w, this.bottom);
      image(topImg, this.x, 0, this.w, this.top);
    }
    popStyle();
  }

  boolean offscreen() {
    return this.x < -this.w;
  }

  boolean hits(Bird bird) {
    this.struck = (bird.y - bird.radius < this.top
      || bird.y + bird.radius  > height - this.bottom)
      && (bird.x + bird.radius > this.x
      && bird.x - bird.radius < this.x+this.w);
    return this.struck;
  }

  boolean isBehind(Bird bird) {
    return bird.x - bird.radius > this.x + this.w;
  }

  boolean scoreUpdateNeeded(Bird bird) {
    return !this.addedToScore && this.isBehind(bird);
  }
}