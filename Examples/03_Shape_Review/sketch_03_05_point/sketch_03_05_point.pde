void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  stroke(255);
  // 1. Since points are so minimal, there is more significance to HOW
  //    they are distributed in the space, the weight and color given
  //    to them, than to the form itself. Consider noise vs. random,
  //    pointillism as an artistic school.
  strokeWeight(random(1, 2.5));
  point(random(0, width), random(0, height));
}