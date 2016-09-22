class Timer {
  String name;
  int start, stop, scheduledStart, scheduledStop;
  boolean started, stopped, startScheduled, stopScheduled;

  Timer() {
    this.name = "Timer";
  }

  Timer(String name) {
    this.name = name;
  }

  public String toString() {
    return "NAME: " + this.name
   + "\nSTART: " + this.start
   + "\nSTOP: " + this.stop
   + "\nELAPSED: " + this.elapsed();
  }

  int toggle() {
    if (this.started && this.stopped) {
      this.reset();
      return this.start();
    } else if (this.started && !this.stopped) {
      return this.stop();
    } else if (!this.started && !this.stopped) {
      return this.start();
    }
    return -1;
  }

  int start() {
    if (!this.started && !this.stopped) {
      this.start = millis();
      this.started = true;
      this.startScheduled = false;
    } else if (this.started && this.stopped) {
      this.reset();
      this.start = millis();
      this.started = true;
      this.startScheduled = false;
    }
    println("Timer started at " + this.start);
    return this.start;
  }

  int start(int seconds) {
    start();
    scheduleStop(seconds);
    return this.start;
  }

  int stop() {
    if (this.started && !this.stopped) {
      this.stop = millis();
      this.stopped = true;
      this.stopScheduled = false;
    }
    println("Timer stopped at " + this.stop
      + "\nElapsed: " + this.elapsed());
    return this.stop;
  }

  int elapsed() {
    return this.stop - this.start;
  }

  void tick() {
    if (!this.started && this.startScheduled && millis() >= this.scheduledStart) {
      start();
    }
    if (!this.stopped && this.stopScheduled && millis() >= this.scheduledStop) {
      stop();
    }
  }

  int scheduleStart(int seconds) {
    if (!this.started && !this.stopped) {
      this.scheduledStart = millis() + (seconds * 1000);
      this.startScheduled = true;
    }
    return this.scheduledStart;
  }

  int scheduleStop(int seconds) {
    if (!this.stopped) {
      this.scheduledStop = millis() + (seconds * 1000);
      this.stopScheduled = true;
    }
    return this.scheduledStop;
  }

  void reset() {
    this.start = 0;
    this.stop = 0;
    this.scheduledStart = 0;
    this.scheduledStop = 0;
    this.started = false;
    this.stopped = false;
    this.startScheduled = false;
    this.stopScheduled = false;
  }
}