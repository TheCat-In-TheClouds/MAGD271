class Title extends State {
  void onEnter() {
    println("Entering " + this + " state.");
  }

  void onSustain() {
    pushStyle();
    background(32);
    rectMode(CENTER);
    noStroke();
    fill(255, 0, 0, 64);
    rect(width / 2.0, height / 2.0, width, height / 4.0);
    textAlign(CENTER, CENTER);
    textSize(24);
    fill(255);
    text("FLAPPY CLONE", width / 2.0, height / 2.0);
    popStyle();
  }

  void onExit() {
    println("Exiting " + this + " state.");
  }

  void onMousePressed() {
    sm.set("Playing");
  }

  void onKeyReleased() {
  }
}