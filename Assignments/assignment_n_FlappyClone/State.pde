abstract class State {
  abstract void onEnter();
  abstract void onSustain();
  abstract void onExit();
  abstract void onMousePressed();
  abstract void onKeyReleased();
  
  public String toString() {
    return this.getClass().getSimpleName();
  }
}