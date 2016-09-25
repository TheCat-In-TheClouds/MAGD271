StateMachine sm;
ButtonRect playButton;
ButtonCirc forfeitButton;
Timer t;

void setup() {
  size(420, 420);
  background(64);
  sm = new StateMachine(State.TITLE);
  playButton = new ButtonRect(width / 2.0 - 60, height / 2.0 - 20, width / 2.0 + 60, height / 2.0 + 20, 5, "PLAY");
  forfeitButton = new ButtonCirc(width / 2.0, height * 3 / 4.0, 50, "FORFEIT", false);
  t = new Timer("playTimer");
}

void draw() {
  background(36);
  sm.onSustain();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (sm.current == State.TITLE) {
      if (playButton.bounds()) {
        sm.set(State.PLAY);
      } else if (forfeitButton.bounds()) {
        sm.set(State.LOSS);
      }
    } else if (sm.current == State.PLAY) {
      sm.set(State.VICTORY);
    } else if (sm.current == State.VICTORY || sm.current == State.LOSS) {
      sm.set(State.TITLE);
    }
  } else if (mouseButton == RIGHT) {
  } else if (mouseButton == CENTER) {
  }
}