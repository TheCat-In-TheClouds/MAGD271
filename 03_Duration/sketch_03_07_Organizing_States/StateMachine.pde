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
    println("Leaving title. Have fun on your adventure.");
  }

  private void playOnExit() {
    println("You're leaving the mission area.");
  }

  private void victoryOnExit() {
    println("Don't sit on your laurels.");
  }

  private void lossOnExit() {
    println("Rejoining the fight.");
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
    println("Welcome! You've now entered the title screen.");
  }

  private void playOnEnter() {
    println("You've entered the arena!");
  }

  private void victoryOnEnter() {
    println("Victory.");
  }

  private void lossOnEnter() {
    println("Game Over.");
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
    text("TITLE SCREEN", width / 2.0, height / 2.0);
  }

  private void playOnSustain() {
    text("PLAYING", width / 2.0, height / 2.0);
  }

  private void victoryOnSustain() {
    text("VICTORY", width / 2.0, height / 2.0);
  }

  private void lossOnSustain() {
    text("GAME OVER", width / 2.0, height / 2.0);
  }
}