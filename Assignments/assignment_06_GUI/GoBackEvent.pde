class GoBackEvent extends Event {
  void call() {
    sm.set(sm.previous);
  }
}