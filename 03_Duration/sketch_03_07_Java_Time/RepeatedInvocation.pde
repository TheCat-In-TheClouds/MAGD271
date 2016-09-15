class RepeatedInvocation extends TimerTask {
  
  RepeatedInvocation() {
    println("RepeatedInvocation scheduled.");
  }
  
  public void run() {
    println("Doing some work over and over.");
  }
}