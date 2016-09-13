// An example of buttons is also available at
// https://processing.org/examples/button.html

// 1. An int is short for integer. It is a primitive data type
//    in Java designed to hold whole numbers that have no
//    decimal point. You can name your integer variable whatever
//    you want, so I've named this one 'x1'.
int x1 = 100;

void setup() {
  size(680, 420);
  background(32);
  
  // 2. There are four rectMode possibilities:
  //    CENTER treats w/2 and h/2 as the rectangle's pivot / registration point,
  //           and draws -w/2, +w/2, -h/2, +h/2 dimensions from there.
  //    CORNER (default) treats the top left corner as the rectangle's pivot
  //                     and draws w and h dimensions from there.
  //    CORNERS draws the top left corner and the bottom right corner.
  //    RADIUS treats w/2 and h/2 as the rectangle's pivot / registration point,
  //           and draws -w, +w, -h, +h dimensions from there.
  rectMode(CORNERS);
}

void draw() {
  background(32);
  
  // 3. Remember graphing linear inequalities in math class?
  //    This is the same idea. the if() { } else { } syntax
  //    checks to see if a condition is true or false, and
  //    performs one action if so, another if not. The condition
  //    in this case is whether the mouse's x-position, mouseX
  //    is greater than x1, the same variable used later to 
  //    draw the button's left side. You can use println() to
  //    debug if you are unsure whether or not the condition
  //    your writing code for ever gets met or not.
  println(mouseX);
  println(mouseX > x1);
  
  // 4. The equality operator is '==' because '=' is already used
  //    for the assignment operator. The inequality operator is '!='.
  //    You do not have to explicitly say mouseX > x1 != false, or
  //    the below, you can just say mouseX > x1.
  if(mouseX > x1 == true) {
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  rect(x1, 0, width, height);
}