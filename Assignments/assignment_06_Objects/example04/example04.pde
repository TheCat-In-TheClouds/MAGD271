Mouser m;
Thumper t;

void setup() {
  size(420, 420);
  background(64);
  noStroke();
  rectMode(CENTER);
  m = new Mouser();
  t = new Thumper();
}

void draw() {
  background(32);
  m.show();
  t.show();
  t.keepTrack(m);
  m.keepTrack(t);
}