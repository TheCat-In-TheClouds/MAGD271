void setup() {
  size(420, 420);
  noStroke();
  println("millis() at end of setup: " + millis());
}

void draw() {
  background(32);
  // 1. You can use the modulo operator to establish an interval during which
  //    an event occurs. This is handy if you don't want to change the global
  //    frameRate(60), but you want to slow down an update to a frame of
  //    animation. The modulo operator means that every time the frame count
  //    is cleanly divisible by 100 with no remainder, the code will execute
  //    the code in the curly braces { }.
  if (frameCount % 500 == 0) {
    fill(0, 255, 0);
    ellipse(width / 4.0, height / 4.0, 100, 100);
  }

  if (frameCount % 60 == 0) {
    fill(0, 0, 255);
    ellipse(width * 3 / 4.0, height / 4.0, 100, 100);
  }

  // 2. Why does millis() % 1000 not work then? You can see why
  //    if you println(millis()) in setup and in draw. Depending
  //    on how much work you're doing in setup and in each draw
  //    call, the duration of time will not be exact, and so
  //    you can't depend on it being cleanly divisible.
  println(millis());
  
  // 3. millis() does not increase at a regular
  //    rate. In my case:
  //    368
  //    383 = 368 + 15
  //    399 = 383 + 16
  //    416 = 399 + 17
  //    432 = 416 + 16
}