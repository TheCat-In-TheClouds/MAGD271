class ExampleEventB extends Event {
  void call() {
    sm.set("ExampleStateC");
  }
}