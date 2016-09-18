// 1. We can measure duration either in terms of milliseconds
//    or in terms of frames by subtracting the start from the stop.
int startInMillis;
int stopInMillis;
int durationInMillis;

int startInFrames;
int stopInFrames;
int durationInFrames;

void setup() {
  size(420, 420);
  background(32);
}

void draw() {
}

void mousePressed() {
  // 2. mouseButton is a keyword which tracks the LEFT,
  // RIGHT, and CENTER mouse buttons. Used in combination
  // with if statements, you can partition your mousePressed
  // function to do different things based on the button.
  if (mouseButton == LEFT) {
    
    // 3. The problem with this, and a problem that you
    //    will often encounter with timers, is that there
    //    is no boolean to track to see if the timer was
    //    already started, and hence should not be restarted,
    //    when this mouse button was clicked....
    startInMillis = millis();
    startInFrames = frameCount;

    fill(54, 255, 54);
    rect(0, 0, width, height);
    println("Timer started!");
  } else if (mouseButton == RIGHT) {
    
    // 4. And nothing to prevent the timer from being "stopped"
    //    when it wasn't started to begin with.
    stopInMillis = millis();
    stopInFrames = frameCount;

    durationInMillis = stopInMillis - startInMillis;
    durationInFrames = stopInFrames - startInFrames;

    println("FRAMES start: " + startInMillis
      + " stop: " + stopInMillis
      + " duration: " + durationInMillis);

    println("MILLIS start: " + startInFrames
      + " stop: " + stopInFrames
      + " duration: " + durationInFrames);

    fill(255, 54, 54);
    rect(0, 0, width, height);
  }
}