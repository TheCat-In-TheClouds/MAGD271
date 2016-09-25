class FrameCounter extends Duration {

  FrameCounter() {
    super();
  }
  
  FrameCounter(String n) {
    super(n);
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
    println(this.name + " started at " + this.start);
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
    println(this);
    return this.stop;
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
}