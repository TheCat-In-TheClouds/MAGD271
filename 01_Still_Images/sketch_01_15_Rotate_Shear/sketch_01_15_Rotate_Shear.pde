PImage r;

// 1. Just as in lesson 01-09, on hue, theta is an angle of
//    rotation around a circle.
float theta = 0.0;
// 2. Curious how many times your object has rotated a full
//    360 degrees? This variable will keep track of that.
float numberOfRotations = 0;

// 3. These are floats to record the coordinates of a pivot
//    or a center used by translation.
float pivotX;
float pivotY;

void setup() {
  size(680, 420);
  background(32);
  r = loadImage("r.png");
  imageMode(CENTER);
  pivotX = width * 3 / 4.0;
  pivotY = height * 3 / 4.0;
}

void draw() {
  blendMode(ADD);

  // 4. Operations such as changing the origin, rotating
  //    and skewing need to be enclosed in pushMatrix();
  //    and popMatrix();
  pushMatrix();

  // 5. Translate changes the origin from the top-left
  //    corner of the sketch to the x, y coordinates specified.
  //    Used in conjunction with rotation, it's also helpful
  //    to think of translate as setting the pivot point
  //    around which an object will rotate.
  translate(width / 4.0, height / 2.0);

  // 6. '+=' is a shorthand for theta = theta + 0.01; theta
  //    is increased by a small amount every frame.
  theta += 0.01;

  // 7. Processing natively works in radians, not degrees. So
  //    the equivalent of this would be degrees(theta) / 360.
  numberOfRotations = theta / TWO_PI;

  // 8. Prints the current rotation.
  println(degrees(theta) % 360 + " " + numberOfRotations);

  // 9. Call rotate(angle) before the object you want to rotate.
  rotate(theta);
  // 10. Notice that because we want the center of the image to
  //     be the axis around which it rotates, we can use 0, 0 for
  //     its position. Try offsetting this to see the difference.
  tint(255, 0, 0, 27);
  image(r, 0, 0, r.width / 3, r.height / 3);
  popMatrix();

  pushMatrix();
  // 11. The pivot point to which the origin is translated does not
  //     have to remain a fixed point, either.
  // translate(width * 3 / 4.0, height / 4.0);
  pivotX = (pivotX + 1) % width;
  pivotY = (pivotY + 1) % height;
  translate(pivotX, pivotY);
  shearX(theta % TWO_PI);
  tint(0, 255, 0, 27);
  image(r, 0, 0, r.width / 3, r.height / 3);
  popMatrix();

   pushMatrix();
   translate(pivotY / 2.0, pivotX / 2.0);
   shearY(theta % TWO_PI);
   tint(0, 0, 255, 27);
   image(r, 0, 0, r.width / 3, r.height / 3);
   popMatrix();
}