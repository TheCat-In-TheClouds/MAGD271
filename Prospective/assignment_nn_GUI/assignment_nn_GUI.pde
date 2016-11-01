StateMachine sm;

void setup() {
  size(680, 420);

  sm = new StateMachine(
    new ExampleStateA(),
    new ExampleStateB(),
    new ExampleStateC()
    );
}

void draw() {
  sm.current.onSustain();
}

void keyPressed() {
  sm.current.keyPressed();
}

void mouseReleased() {
  sm.current.mouseReleased();
  IS_DRAGGING = false;
}

void mouseDragged() {
  IS_DRAGGING = true;
}