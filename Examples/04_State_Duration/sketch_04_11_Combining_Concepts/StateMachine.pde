class StateMachine {
  State previous;
  State current;

  float start = 0;
  float desiredDuration = 3000;

  StateMachine(State current) {
    this.set(current);
  }

  void set(State s) {
    this.previous = this.current;
    this.current = s;
    println("PREVIOUS: " + this.previous
      +"\nCURRENT: " + this.current);
    onExit();
    onEnter();
  }

  void onEnter() {
    if (current != null) {
      if (current == State.TITLE) {
        titleOnEnter();
      } else if (current == State.PLAY) {
        playOnEnter();
      } else if (current == State.VICTORY) {
        victoryOnEnter();
      } else if (current == State.LOSS) {
        lossOnEnter();
      } else {
        transitionOnEnter();
      }
    }
  }

  private void titleOnEnter() {
  }

  private void playOnEnter() {
    t.start(10);
  }

  private void victoryOnEnter() {
  }

  private void lossOnEnter() {
  }

  private void transitionOnEnter() {
  }

  void onSustain() {
    if (current == State.TITLE) {
      titleOnSustain();
    } else if (current == State.PLAY) {
      playOnSustain();
    } else if (current == State.VICTORY) {
      victoryOnSustain();
    } else if (current == State.LOSS) {
      lossOnSustain();
    } else {
      transitionOnSustain();
    }
  }

  private void titleOnSustain() {
    pushStyle();
    textAlign(CENTER, CENTER);
    textSize(42);
    fill(255);
    text("TITLE SCREEN", width / 2.0, 52);
    popStyle();

    playButton.draw();
    forfeitButton.draw();
  }

  private void playOnSustain() {
    t.tick();
    if(t.stopped) {
      set(State.LOSS);
    }
    pushStyle();
    textAlign(CENTER, CENTER);
    textSize(42);
    fill(255);
    text("PLAYING", width / 2.0, 52);
    noStroke();
    fill(54, 255, 0);
    rect(0, height - 10, map(t.scheduledStop - millis(), 0, 10000, 0, width), height);
    popStyle();
  }

  private void victoryOnSustain() {
    pushStyle();
    textAlign(CENTER, CENTER);
    textSize(42);
    fill(0, 127, 255);
    text("VICTORY", width / 2.0, 52);
    textSize(14);
    fill(255);
    text("TIME: " + (t.elapsed() / 1000.0), width / 2.0, 100);
    popStyle();
  }

  private void lossOnSustain() {
    pushStyle();
    textAlign(CENTER, CENTER);
    textSize(42);
    fill(255, 0, 0);
    text("GAME OVER", width / 2.0, 52);
    popStyle();
  }

  private void transitionOnSustain() {
  }

  void onExit() {

    if (previous != null) {
      if (previous == State.TITLE) {
        titleOnExit();
      } else if (previous == State.PLAY) {
        playOnExit();
      } else if (previous == State.VICTORY) {
        victoryOnExit();
      } else if (previous == State.LOSS) {
        lossOnExit();
      } else {
        transitionOnExit();
      }
    }
  }

  private void titleOnExit() {
  }

  private void playOnExit() {
    t.stop();
  }

  private void victoryOnExit() {
    t.reset();
  }

  private void lossOnExit() {
    t.reset();
  }

  private void transitionOnExit() {
  }
}