// 1. If you are comfortable with programming and using
//    Java libraries, it will be worth your while to research
//    and use a professional timer library rather than
//    working with Processing's tools.
//    Likely there are debates out there about which timers
//    are appropriate for which situations.

import java.util.Timer;
import java.util.TimerTask;

Timer t;
int seconds = 5;

void setup() {
  t = new Timer();
  t.schedule(new RepeatedInvocation(), 0, seconds * 2000);
}

void draw() {
}

void mouseReleased() {
  t.schedule(new Invocation(), seconds * 1000);
}