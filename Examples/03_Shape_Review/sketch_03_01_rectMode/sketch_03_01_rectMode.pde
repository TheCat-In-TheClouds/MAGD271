void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  background(32);
  noStroke();

  // 1. CENTER draws 1/2 rectangle's width and height out from the center,
  //    making the placment of a rectangle more akin to that of an ellipse.
  //    You can also round the corners of a rect by adding an extra number
  //    after the height.
  rectMode(CENTER);
  fill(255, 0, 0, 127);
  rect(width * 0.5, height * 0.5, width * 0.85, height * 0.85, 20);

  // 2. CORNER is the default rectangle mode. It draws the rectangle from
  //    the top left corner to the width and height specified.
  rectMode(CORNER);
  fill(0, 255, 0, 127);
  rect(width * 0.5, height * 0.5, width * 0.45, height * 0.5, 10);

  // 3. Similar to center except this draws the whole number specified
  //    out from the rectangle's pivot.
  rectMode(RADIUS);
  fill(0, 0, 255, 127);
  // 4. If you want to define the rounding of each rect corner
  //    individually, you can add four extra numbers after the height,
  //    starting with the top-left corner and moving clockwise.
  rect(width * 0.5, height * 0.5, width * 0.25, height * 0.25, 
    25, 50, 75, 100);

  // 5. CORNERS lets you specify the top-left and bottom-right
  //    corner of the rectangle rather than the width and height.
  rectMode(CORNERS);
  fill(255, 255, 0, 127);
  rect(width * 0.5, height * 0.5, width * 0.7, height * 0.3, 5);
}