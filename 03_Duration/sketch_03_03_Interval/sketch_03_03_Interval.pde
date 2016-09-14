void setup() {
  size(420, 420);
  noStroke();
  println(millis());
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

  // 2. ceil(float) always rounds a floating point number up to an integer
  //    no matter how small the first decimal number. ceil(4.3) == 5. So,
  //    if the frame rate is 60 per second, then the frame count will be
  //    cleanly divisible by 60 every one second.
  if (frameCount % ceil(frameRate) == 0) {
    fill(255, 0, 0);
    ellipse(width * 3 / 4.0, height / 4.0, 100, 100);
  }
  
  // 3. Why does millis() % 1000 not work then? You can see why
  //    if you println(millis()) in setup and in draw. Depending
  //    on how much work you're doing in setup and in each draw
  //    call, the duration of time will not be exact, and so
  //    you can't depend on it being cleanly divisible.
  // println(millis());
}