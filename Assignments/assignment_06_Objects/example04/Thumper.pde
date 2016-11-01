class Thumper {
  PVector position, scale, speed;
  color fill;

  Thumper() {
    position = new PVector(random(0, width * .1), random(height * .5, height * .8));
    scale = new PVector(30, 30);
    speed = new PVector(random(1, 2), 0);
  }

  void show() {
    if (position.x <= width) {
      position.add(speed);
    }
    fill(fill);
    rect(position.x, position.y, scale.x, scale.y);
  }

  void keepTrack(Mouser m) {
    fill = color(255, 0, 
      map(m.position.x, 0, width, 0, 255)
      );
  }
}