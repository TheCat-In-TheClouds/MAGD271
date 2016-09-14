TimerA nt;
int explosionOnScreen = 0;

TimerB jt1;
TimerB jt2;

void setup() {
  size(200, 200);
  background(32);
  textAlign(CENTER, CENTER);

  nt = new TimerA(5000);

  jt1 = new TimerB("TimerB-Manual");

  // 1. Schedules a starting and stopping point
  //    which will operate on its own so long as
  //    tick() is called in the draw function.
  jt2 = new TimerB(5000, 10000, "TimerB-Scheduled");
}

void draw() {
  background(32);
  
  jt2.tick();

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

  // 4. Suppose you want a concluding action, like an
  //    explosion to be called once and only once on
  //    the timer finishing up. You can do something like
  //    this, where the function you call turns the
  //    concludingAction boolean from false to true.
  if (jt1.finished() && !jt1.concludingAction) {
    concludingAction();
    jt1.concludingAction = true;
  }
  
  // 5. Uses the modulo operator to return a true or
  //    false. Not as useful for milliseconds as for
  //    frames, since the milliseconds spent in setup
  //    can vary.
  if(jt1.interval(360, FRAMES)) {
    println(jt1.name + " 360 frame interval");
  }
}

void mousePressed() {
  if (!nt.started) {
    nt.timerStart();
  } else {
    nt.stopTimer();
  }

  if (jt1.isRunning) {
    jt1.stop();
  } else {
    jt1.start();
  }
}

void concludingAction() {
  println("This is a one-off action upon the timer's finish.");
}