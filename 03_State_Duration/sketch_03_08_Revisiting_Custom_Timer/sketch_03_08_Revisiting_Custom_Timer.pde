Timer nt;
int explosionOnScreen = 0;

void setup() {
  size(200, 200);
  background(32);
  textAlign(CENTER, CENTER);

  nt = new Timer(5000);
}

void draw() {
  background(32);

  // 2. Suppose you want explosion to show on the screen
  //    forever after the nt timer is finished.
  //if(nt.isFinished()) {
  //  fill(255);
  //  text("EXPLOSION!", 100, 100);
  //}

  // 3. Suppose you want explosion to only remain on
  //    the screen for a fixed amount of time.
  if (nt.isFinished() && explosionOnScreen < 100) {
    fill(255);
    text("EXPLOSION!", 100, 100);
    explosionOnScreen++;
  }
}

void mousePressed() {
  if (!nt.started) {
    nt.timerStart();
    explosionOnScreen = 0;
  } else {
    nt.stopTimer();
  }
}