class Invocation extends TimerTask {
  
  Invocation() {
    println("Invocation scheduled.");
  }
  
  public void run() {
    println("Invocation did its work and now it will stop.");
    t2.cancel();
  }
}