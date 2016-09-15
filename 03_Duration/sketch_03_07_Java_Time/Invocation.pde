class Invocation extends TimerTask {
  
  Invocation() {
    println("Invocation scheduled.");
  }
  
  public void run() {
    println("Time's up.");
    t.cancel();
  }
}