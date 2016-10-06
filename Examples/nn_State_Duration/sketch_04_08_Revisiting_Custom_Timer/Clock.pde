class Clock extends Duration {
  TimeStamp start, stop, scheduledStart, scheduledStop;

  Clock() {
    super();
  }

  Clock(String n) {
    super(n);
  }

  public String toString() {
    return "NAME:\t" + this.name
      + "\nSTOP:\t" + this.stop
      + "\nSTART:\t" + this.start
      + "\nELAPSED:\t" + this.elapsed();
  }

  int start() {
    if (!this.started && !this.stopped) {
      this.start = new TimeStamp();
      this.started = true;
      this.startScheduled = false;
      super.start = this.start.get();
    } else if (this.started && this.stopped) {
      this.reset();
      this.start = new TimeStamp();
      this.started = true;
      this.startScheduled = false;
      super.start = this.start.get();
    }
    println(this.name + " started at " + this.start);
    return super.start;
  }

  int start(int seconds) {
    this.start();
    this.scheduleStop(seconds);
    return super.start;
  }

  int stop() {
    if (this.started && !this.stopped) {
      this.stop = new TimeStamp();
      this.stopped = true;
      this.stopScheduled = false;
      super.stop = this.stop.get();
    }

    println(this);
    return super.stop;
  }

  void tick() {
    if (!this.started
      && this.startScheduled
      && this.scheduledStart.compareTo(convertToSeconds()) == 0) {
      start();
    }
    if (!this.stopped
      && this.stopScheduled
      && this.scheduledStop.compareTo(convertToSeconds()) == 0) {
      stop();
    }
  }

  int scheduleStart(int hour, int minute, int second) {
    if (!this.started && !this.stopped) {
      this.scheduledStart = new TimeStamp(hour, minute, second);
      this.startScheduled = true;
    }
    return super.scheduledStart = this.scheduledStart.get();
  }

  int scheduleStart(int seconds) {
    if (!this.started && !this.stopped) {
      this.scheduledStart = new TimeStamp(convertToSeconds() + seconds);
      this.startScheduled = true;
    }
    return super.scheduledStart = this.scheduledStart.get();
  }

  int scheduleStop(int hour, int minute, int second) {
    if (!this.stopped) {
      this.scheduledStop = new TimeStamp(hour, minute, second);
      this.stopScheduled = true;
    }
    return super.scheduledStart = this.scheduledStart.get();
  }

  int scheduleStop(int seconds) {
    if (!this.stopped) {
      this.scheduledStop = new TimeStamp(convertToSeconds() + seconds);
      this.stopScheduled = true;
    }
    return super.scheduledStop = this.scheduledStop.get();
  }
}