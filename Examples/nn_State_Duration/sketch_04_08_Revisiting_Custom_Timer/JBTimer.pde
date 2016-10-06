class JBTimer extends Duration {

  JBTimer() {
    super();
  }

  JBTimer(String n) {
    super(n);
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
    println(this.name + " started at " + this.start);
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
    println(this);
    return this.stop;
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
      println(this.name + " stop scheduled at " + (this.scheduledStop - seconds * 1000) + " for " + this.scheduledStop);
    }
    return this.scheduledStop;
  }
}