abstract class State {
  abstract void onEnter();
  abstract void onSustain();
  abstract void onExit();
  
  abstract void onMousePressed();
  abstract void onKeyReleased();
  // add more events as needed, for example
  // onMouseDragged, onKeyPressed, etc.
  
  public String toString() {
    return this.getClass().getSimpleName();
  }
}