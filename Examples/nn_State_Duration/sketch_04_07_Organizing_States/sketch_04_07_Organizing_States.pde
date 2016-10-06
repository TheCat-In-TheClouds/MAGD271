// 1. The logic in the main sketch was getting
//    messy, so let's shift it to a StateMachine
//    class, which is instantiated as the object sm.
StateMachine sm;

void setup() {
  size(420, 420);
  background(64);

  sm = new StateMachine(State.TITLE);
}

void draw() {
  background(32);
  textAlign(CENTER, CENTER);
  textSize(42);
  fill(255);
  sm.onSustain();
}

void mousePressed() {
  if (sm.current == State.TITLE) {
    sm.set(State.PLAY);
  } else if(sm.current == State.PLAY) {
    sm.set(State.VICTORY);
  } else if(sm.current == State.VICTORY) {
    sm.set(State.TITLE);
  }
}