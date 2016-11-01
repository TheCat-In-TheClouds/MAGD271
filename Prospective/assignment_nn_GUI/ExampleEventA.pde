class ExampleEventA extends Event {
  void call() {
    sm.set("ExampleStateB");
  }
}