void setup() {
}

void draw() {
  // 1. Duration can be measured in two ways in processing:
  //    in the number of frames it takes for something to happen,
  //    in the number of milliseconds (1/1000 of a second it
  //    takes for something to happen.
  //    The code executed in void draw() { } happens in one frame.
  println("frames: " + frameCount);
  println("milliseconds: " + millis());
}