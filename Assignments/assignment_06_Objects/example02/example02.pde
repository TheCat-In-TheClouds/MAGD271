/* 
sound file is from Soundsnap.com
*/

Watchamacallit w;

void setup() {
  background(64);
  size(420, 420);
  w = new Watchamacallit(this);
}

void draw() {
  background(32);
}

void keyReleased() {
  w.interact();
}