// 1. Ideally, text input would couple with a State Machine.
boolean entryCompleted = false;

TextInput t;

void setup() {
  size(680, 420);
  background(64);
  t = new TextInput(width / 2.0 - 80, 
    height / 2.0 - 12, 
    width / 2.0 + 80, 
    height / 2.0 + 12, 5, 
    "What is your name?");
}

void draw() {
  background(36);

  if (entryCompleted) {
    text("Hello " + t.value + ", nice to meet you.", width / 2.0, height / 2.0);
  } else {
    t.update();
  }
}

void mousePressed() {
  t.toggle = t.bounds();
}

void keyTyped() {
  entryCompleted = t.listen();
}