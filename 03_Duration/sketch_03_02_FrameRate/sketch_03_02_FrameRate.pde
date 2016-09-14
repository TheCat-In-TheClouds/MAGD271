// 1. Frame rate is the relationship between frames and time.
//    60 frames per second = 60 frames per 1000 milliseconds.

void setup() {
  // 3. You can also change the frame rate. This is very help-
  //    ful if you want to adjust an animation.
  frameRate(24);
}

void draw() {
  // 2. You can check the frameRate by printing it to the
  //    console. Notice that it is a floating decimal point
  //    number, not an integer, and may not be exactly 60.
  println(frameRate);
}