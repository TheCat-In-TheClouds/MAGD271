class TimerC {
  String name;
  int start, stop, scheduledStart, scheduledStop;
  boolean started, stopped, startScheduled, stopScheduled;

  TimerC() {
    this.name = "Timer";
  }

  TimerC(String name) {
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
      this.start = frameCount;
      this.started = true;
      this.startScheduled = false;
    } else if (this.started && this.stopped) {
      this.reset();
      this.start = frameCount;
      this.started = true;
      this.startScheduled = false;
    }
    println("Timer started at " + this.start);
    return this.start;
  }

  int start(int frames) {
    start();
    scheduleStop(frames);
    return this.start;
  }

  int stop() {
    if (this.started && !this.stopped) {
      this.stop = frameCount;
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
    if (!this.started && this.startScheduled && frameCount >= this.scheduledStart) {
      start();
    }
    if (!this.stopped && this.stopScheduled && frameCount >= this.scheduledStop) {
      stop();
    }
  }

  int scheduleStart(int frames) {
    if (!this.started && !this.stopped) {
      this.scheduledStart = frameCount + frames;
      this.startScheduled = true;
    }
    return this.scheduledStart;
  }

  int scheduleStop(int frames) {
    if (!this.stopped) {
      this.scheduledStop = frameCount + frames;
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