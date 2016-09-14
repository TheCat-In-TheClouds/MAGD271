static final int FRAMES = 0;
static final int MILLIS = 1;
static int timerCount = 0;

class TimerB {
  String name = "t0";

  int start = 0;
  int stop = 0;
  int elapsed = 0;
  
  int frameStart = 0;
  int frameStop = 0;
  int framesElapsed = 0;
  
  boolean isRunning = false;
  int startedCount = 0;
  int stoppedCount = 0;

  int scheduledStart;
  int scheduledStop;
  boolean scheduled = false;
  
  boolean concludingAction = false;

  TimerB() {
    timerCount++;
    this.name = "t" + timerCount;
  }
  
  TimerB(String n) {
    this.name = n;
  }

  TimerB(int scheduledStart, int scheduledStop) {
    this.scheduledStart = scheduledStart;
    this.scheduledStop = scheduledStop;
    timerCount++;
    this.name = "t" + timerCount;
  }
  
  TimerB(int scheduledStart, int scheduledStop, String n) {
    this.scheduledStart = scheduledStart;
    this.scheduledStop = scheduledStop;
    timerCount++;
    this.name = n;
  }

  public String toString() {
    return this.name 
      + " summary\r\nstart:\t" + start + " millis, " + frameStart
      + " frames\r\nstop:\t" + stop + " millis, " + frameStop
      + " frames\r\nelapsed:\t" + elapsed + " millis, " + framesElapsed
      + " frames";
  }

  int start() {
    concludingAction = false;
    return start(MILLIS);
  }

  int start(int measure) {
    start = millis();
    frameStart = frameCount;
    isRunning = true;
    startedCount++;
    println(this.name + " started");
    if (measure == FRAMES) {
      return frameStart;
    } else {
      return start;
    }
  }

  int stop() {
    return stop(MILLIS);
  }

  int stop(int measure) {
    if(!isRunning) {
      return 0;
    }
    
    stop = millis();
    frameStop = frameCount;
    elapsed = stop - start;
    framesElapsed = frameStop - frameStart;
    isRunning = false;
    stoppedCount++;
    println(this.toString());
    if (measure == FRAMES) {
      return frameStop;
    } else {
      return stop;
    }
  }

  int elapsed() {
    return elapsed(MILLIS);
  }

  int elapsed(int measure) {
    if (isRunning) {
      elapsed = millis() - start;
      framesElapsed = frameCount - frameStart;

      if (measure == FRAMES) {
        return framesElapsed;
      } else {
        return elapsed;
      }
    }
    return -1;
  }

  boolean interval(int i) {
    return interval(i, MILLIS);
  }

  boolean interval(int i, int measure) {
    if (this.elapsed(measure) > 0) {
      return this.elapsed(measure) % i == 0;
    } else {
      return false;
    }
  }

  void tick() {
    tick(MILLIS);
  }

  void tick(int measure) {
    if (measure == FRAMES) {
      if (!isRunning && !scheduled && frameCount >= scheduledStart) {
        start(measure);
        scheduled = true;
      }
      if (isRunning && scheduled && frameCount >= scheduledStop) {
        stop(measure);
      }
    } else {
      if (!isRunning && !scheduled && millis() >= scheduledStart) {
        start(measure);
        scheduled = true;
      }
      if (isRunning && scheduled && millis() >= scheduledStop) {
        stop(measure);
      }
    }
  }
  
  boolean finished() {
    return stoppedCount >= startedCount && stoppedCount > 0;
  }
}