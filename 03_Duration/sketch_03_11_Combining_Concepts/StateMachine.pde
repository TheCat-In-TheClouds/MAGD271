class StateMachine {
  State current;
  State previous;

  StateMachine(State current) {
    this.current = current;
  }

  void set(State s) {
    this.previous = this.current;
    this.current = s;
    onExit();
    onEnter();
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
      }
    }
  }

  private void titleOnExit() {
  }

  private void playOnExit() {
  }

  private void victoryOnExit() {
  }

  private void lossOnExit() {
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
      }
    }
  }

  private void titleOnEnter() {
  }

  private void playOnEnter() {
  }

  private void victoryOnEnter() {
  }

  private void lossOnEnter() {
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
    }
  }

  private void titleOnSustain() {
    pushStyle();
    textAlign(CENTER, CENTER);
    textSize(42);
    fill(255);
    text("TITLE SCREEN", width / 2.0, 52);
    popStyle();

    playButton.update();
    forfeitButton.update();
  }

  private void playOnSustain() {
  }

  private void victoryOnSustain() {
    pushStyle();
    textAlign(CENTER, CENTER);
    textSize(42);
    fill(0, 127, 255);
    text("VICTORY", width / 2.0, 52);
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
}