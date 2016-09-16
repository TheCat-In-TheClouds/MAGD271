class TimerC {
  // If you name your timer, it will be easier
  // to identify it if you have multiple timers
  // in your sketch.
  String name;

  // There are three key pieces of information
  // that a timer needs to measure
  int start = 0;
  int stop = 0;
  int elapsed = 0;

  // A timer can be started, but not stopped, but
  // it can't be 'stopped' without having been started
  // in the first place. Whether or not the timer
  // is running is a combination of these two, where the
  // timer has been started but has not been stopped.
  boolean hasBeenStarted = false;
  boolean hasBeenStopped = false;

  // These two constructors do nothing beyond construct
  // the instance of the class and assign it a name (optional).
  TimerC() {
    this.name = "Timer";
  }

  TimerC(String name) {
    this.name = name;
  }

  public String toString() {
    return this.name;
  }

  // The start() and stop() functions deal with 2 ^ 2 = 4
  // possibilities between the two booleans hasBeenStarted
  // and hasBeenStopped:
  //          started  stopped
  //                T        F
  //   started  T  TT       TF
  //   stopped  F  FT       FF
  // Technically, in the logic of this Timer, it is
  // invalid to have been stopped without having first
  // been started, and the final else case should hopefully
  // be unreachable.

  int start() {
    if (this.hasBeenStarted && this.hasBeenStopped) {
      println("Please reset " + this.name + " before starting again.");
      return this.start;
    } else if (this.hasBeenStarted && !this.hasBeenStopped) {
      println(this.name + " was already started at " + this.start + " milliseconds.");
      return this.start;
    } else if (!this.hasBeenStarted && this.hasBeenStopped) {
      println("Error. " + this.name + " should not have been stopped without having been started.");
      return 0;
    } else if (!this.hasBeenStarted && !this.hasBeenStopped) {
      this.start = millis();
      this.hasBeenStarted = true;
      println(this.name + " started " + this.start + " milliseconds after the program started.");
      return this.start;
    } else {
      println("Unexpected case in Timer start(). Look at the code for errors.");
      return 0;
    }
  }

  int stop() {
    if (this.hasBeenStarted && this.hasBeenStopped) {
      println(this.name + " was already stopped at " + this.stop + " milliseconds.");
      return this.stop;
    } else if (this.hasBeenStarted && !this.hasBeenStopped) {
      this.stop = millis();
      this.hasBeenStopped = true;
      this.elapsed = this.stop - this.start;
      println(this.name + " stopped " + this.stop + " milliseconds after the program started.");
      println(this.name + " elapsed time: " + this.elapsed + " milliseconds.");
      return this.stop;
    } else if (!this.hasBeenStarted && this.hasBeenStopped) {
      println("Error. " + this.name + " should not have been stopped without having been started.");
      return 0;
    } else if (!this.hasBeenStarted && !this.hasBeenStopped) {
      println(this.name + " has not been started.");
      return 0;
    } else {
      println("Unexpected case in Timer stop(). Look at the code for errors.");
      return 0;
    }
  }

  int elapsed() {
    if (this.hasBeenStarted && this.hasBeenStopped) {
      // println(this.name + " elapsed time: " + this.elapsed + " milliseconds.");
      return this.elapsed;
    } else if (this.hasBeenStarted && !this.hasBeenStopped) {
      // println(this.name + " has not been stopped. Elapsed time " + (millis() - this.start) + " is not finalized.");
      return millis() - this.start;
    } else if (!this.hasBeenStarted && this.hasBeenStopped) {
      // println("Error. " + this.name + " should not have been stopped without having been started.");
      return 0;
    } else if (!this.hasBeenStarted && !this.hasBeenStopped) {
      // println(this.name + " has been neither stopped nor started.");
      return 0;
    } else {
      // println("Unexpected case in Timer elapsed(). Look at the code for errors.");
      return 0;
    }
  }

  boolean isRunning() {
    return this.hasBeenStarted && !this.hasBeenStopped;
  }

  void reset() {
    println(this.name + " was reset.");
    this.start = 0;
    this.stop = 0;
    this.elapsed = 0;
    this.hasBeenStarted = false;
    this.hasBeenStopped = false;
  }
}