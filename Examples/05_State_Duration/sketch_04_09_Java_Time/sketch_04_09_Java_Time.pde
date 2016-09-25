// 1. If you are comfortable with programming and using
//    Java libraries, it will be worth your while to research
//    and use a professional timer library rather than
//    working with Processing's tools.
//    Likely there are debates out there about which timers
//    are appropriate for which situations.

import java.util.Timer;
import java.util.TimerTask;

Timer t1;
Timer t2;
int seconds = 5;
int delay = 15;

void setup() {
  size(300, 300);
  background(32);
  t1 = new Timer();
  t2 = new Timer();
  // 2. The Timer instance has a schedule method which can be fed
  //    a class that extends TimerTask, a delay before it begins
  //    running and the interval at which to call the run function.
  t1.schedule(new RepeatedInvocation(), delay * 1000, seconds * 1000);
}

void draw() {
}

void mouseReleased() {
  t2.schedule(new Invocation(), seconds * 1000);
}