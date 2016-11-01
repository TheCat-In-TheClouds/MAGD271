abstract class State {
  abstract void onEnter();
  abstract void onSustain();
  abstract void onExit();
  
  abstract void mouseReleased();
  abstract void keyPressed();
  
  public String toString() {
    return this.getClass().getSimpleName();
  }
}