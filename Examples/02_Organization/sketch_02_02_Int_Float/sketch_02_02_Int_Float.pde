// 1. We can use variables to store information for us.

// 2. Each variable has a data type, meaning the kind of information
//    that variable is designed to contain. Different kinds of information
//    require a lot of computer memory, while other kinds of information
//    require only a little, so Processing needs to know what you're
//    working with in advance.

// 3. int is short for integer; it stores whole numbers.
int x1 = 210;
int y1 = 315;
int w1 = 150;
int h1 = 150;

// 4. float is short for floating point decimal; it stores real numbers.
float x2 = 50.5;
float y2 = 75.3;
float w2 = 75.0;
float h2 = 75.0;

void setup() {
  size(420, 420);
  background(32);
  stroke(255);
  strokeWeight(1.5);
  fill(204, 0, 0);
  
  // 5. We can feed these variables to our shapes rather than using constants.
  ellipse(x1, y1, w1, h1);
  fill(0, 204, 0);
  ellipse(x2, y2, w2, h2);
  
  // 6. Notice that we could have also done this for the red, green and blue
  //    values in stroke, fill and background; as well as for the stroke weight.
} 