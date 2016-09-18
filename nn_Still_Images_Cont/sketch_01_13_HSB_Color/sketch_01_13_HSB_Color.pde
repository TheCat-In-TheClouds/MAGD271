// 1. A float is a data type used to store numbers
//    with a floating decimal point, such as 0.25.
//    This float variable has been named 'theta'
//    because it will represent the angle of rotation
//    around a circle.
float theta = 0.0;

// 2. These variables, s for saturation, b for brightness
//    will have a small value added to them every
//    frame until they reach the maximum value of their
//    ranges as defined by colorMode(hsb, hue, saturation,
//    brightness); then they will be reset to 0.
float s = 50;
float b = 50;

void setup() {
  size(680, 420);
  noStroke();
  background(255);

  // 3. The modulo operator, %, is used to find the
  //    remainder from the division of two numbers. If
  //    you think back to your grade school education,
  //    before you learned about writing out decimals
  //    in division, 4 / 3 did not equal 1.3333, but
  //    rather 1 R1, where 1 was the remainder, and the
  //    mixed number was 1 1/3. The modulo operator is
  //    particularly useful for determining whether a
  //    number is even or odd, when a unit of time has
  //    reached an interval, or to increase a value
  //    until it has reached the upper bound of its range
  //    where the lower bound of the range is 0.
  println("0 % 2 == " + 0 % 2);
  println("1 % 2 == " + 1 % 2);
  println("2 % 2 == " + 2 % 2 + " even");
  println("3 % 2 == " + 3 % 2 + " odd");
  println("4 % 2 == " + 4 % 2 + " even");
}

void draw() {  
  // 4. The HSB Representation of color permits hue to be
  //    thought of as a circle. This is why the default
  //    maximum value for hue is 360 (degrees). A circle
  //    can be measured in both radians and degrees, where
  //    a full transit around a circle is 2PIr. Processing
  //    provides the degrees(float r) and radians(float d)
  //    functions to easily move between the two kinds of
  //    measurement. If you need a refresher on this topic,
  //    https://en.wikipedia.org/wiki/Radian has some helpful
  //    diagrams and illustrations. This circular nature is
  //    why all three of the ellipses to follow are the
  //    same color. The only difference to make note of is
  //    that in Processing y increases as you go down, not
  //    as you go up. So the travel around the circle as the
  //    angle in degrees increases toward 360 is clockwise,
  //    not counter-clockwise.
  colorMode(HSB, 360, 100, 100);

  fill(degrees(QUARTER_PI), 100, 100);
  ellipse(width / 2.0 - 150, height / 4.0, 150, 150);

  colorMode(HSB, TWO_PI, 100, 100, 100);

  fill(QUARTER_PI, 100, 100);
  ellipse(width / 2.0, height / 4.0, 150, 150);

  fill(radians(45), 100, 100);
  ellipse(width / 2.0 + 150, height / 4.0, 150, 150);

  // Cycling through hue
  theta = (theta + 0.001) % TWO_PI;
  fill(theta, 100, 100);
  ellipse(width / 2.0 - 150, height * 3 / 4.0, 150, 150);

  // Cycling through saturation
  // 5. The size of the value added to s relative to the
  //    size of the value following the % operator will
  //    dictate the speed at which the saturation changes.
  s = (s + 0.1) % 100;
  fill(theta, s, 100);
  ellipse(width / 2.0, height * 3 / 4.0, 150, 150);

  // Cycling through brightness
  b = (b + 1) % 100;
  fill(theta, 100, b);
  ellipse(width / 2.0 + 150, height * 3 / 4.0, 150, 150);
}