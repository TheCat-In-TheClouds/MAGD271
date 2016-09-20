// 1. Suppose I want to switch two variables around. How do I do that? 
int a = 15;
int b = 4;

float c = 34.4;
float d = 64.8;

PVector v1 = new PVector(3, 14);
PVector v2 = new PVector(5, 10);

void setup() {
  println("a = " + a + ", b = " + b);

  // 2. The classic three-line solution is to create a temporary variable
  //    of the same variable type as the two items to be swapped, then let
  //    it carry the old value of the variable you're about to give a new
  //    value. Then, in the last step you assign the old value to the other
  //    variable which just passed its value on.
  int temp = a;
  a = b;
  b = temp;
  println("a = " + a + ", b = " + b);

  // 3. You can also use addition and subtraction.
  a = a + b;
  b = a - b;
  a = a - b;
  println("a = " + a + ", b = " + b);

  // 4. Depending on the variable type, you can use a one line solution.
  a = a ^ b ^ (b = a);
  println("a = " + a + ", b = " + b);

  // 5. This time, with floats;
  println("c = " + c + ", d = " + d);

  float temp2 = c;
  c = d;
  d = temp2;

  println("c = " + c + ", d = " + d);

  c = c + d;
  d = c - d;
  c = c - d;
  println("c = " + c + ", d = " + d);

  // No dice here. ^ is undefined for floats.
  // c = c ^ d ^ (d = c);
  // println("c = " + c + ", d = " + d);
}