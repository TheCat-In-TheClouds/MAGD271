class Loss extends State {

  void onEnter() {
    println("Entering " + this + " state.");
    fb = game.feedback();
  }

  void onSustain() {
    pushStyle();
    background(32);
    textAlign(CENTER, CENTER);
    textSize(24);
    fill(255);
    text("GAME OVER!"
      + "\r\nYOUR SCORE: " + fb.score
      + "\r\nYOUR TIME: " + nfs(fb.elapsed / 1000.0, 0, 1) + " seconds", 
      width / 2.0, 
      height / 2.0);
    popStyle();
  }

  void onExit() {
    println("Exiting " + this + " state.");
    game.reset();
  }

  void onMousePressed() {
    sm.set("Title");
  }

  void onKeyReleased() {
  }
}