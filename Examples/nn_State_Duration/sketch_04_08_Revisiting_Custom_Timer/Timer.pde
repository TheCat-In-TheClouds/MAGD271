/* SOURCE:
Professor Nick Hwang
https://github.com/rioter00/MAGD150-Assignments/blob/master/Timer_class.pde
*/

class Timer {

  // Two variables to keep track of the time
  // that the timer starts and length of time
  // for the timer.
  float startTime;
  float stopTime; 
  // Keep track of the timer, whether it's been
  // started on not.
  boolean started = false;   

  // Constructor. This sets the amount of the
  // time to lapse before it sets the boolean
  // below to true. an example use would be 
  // Timer myTimer = new Timer(2000);
  // sets the timer to 2 seconds.
  Timer(float _stopTime) {
    stopTime = _stopTime;
  }

  // you can call this anyway (inside the Setup
  // which would start almost immediately or
  // inside the draw loop, which would make it
  // restart every cycle.
  void timerStart() {
    startTime = millis();
    started = true;
    println(this.getClass().getSimpleName() + " started at " + startTime + " for duration " + stopTime);
  }

  void stopTimer() {
    started = false;
    println(this.getClass().getSimpleName() + " stopped at " + (millis() - startTime));
  }

  // place this in your draw() loop to ?
  // the time has lapsed. an example block
  // of code might be:
  //   if (myTimer.isFinished()){
  //      text("EXPLOSION!", 100, 100);
  //    }
  boolean isFinished() {
    float passedTime = millis() - startTime;
    if ((passedTime > stopTime) && (started)) {
      return true;
    } else {
      return false;
    }
  }
}