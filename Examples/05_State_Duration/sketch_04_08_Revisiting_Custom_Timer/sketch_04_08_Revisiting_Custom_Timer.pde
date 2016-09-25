Timer nhTimer;
Duration jbTimer, frameCounter;
int explosionOnScreen = 0;

void setup() {
  size(200, 200);
  background(32);
  textAlign(CENTER, CENTER);

  nhTimer = new Timer(5000);
  jbTimer = new JBTimer();
  frameCounter = new FrameCounter();
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
  if (nhTimer.isFinished() && explosionOnScreen < 100) {
    fill(255);
    text("EXPLOSION!", 100, 100);
    explosionOnScreen++;
  }
  
  jbTimer.tick();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (!nhTimer.started) {
      nhTimer.timerStart();
      explosionOnScreen = 0;
    } else {
      nhTimer.stopTimer();
    }
  } else if(mouseButton == RIGHT) {
    jbTimer.toggle();
  } else if(mouseButton == CENTER) {
    frameCounter.toggle();
  }
}

void keyPressed() {
  if(key == ' ') {
    jbTimer.scheduleStop(5);
  }
}