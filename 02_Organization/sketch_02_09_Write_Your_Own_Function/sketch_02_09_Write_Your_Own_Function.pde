// 1. Anatomy of a function:
//    dataTypeOfReturnValueIfAny functionName(parameter1, parameter2) {
// statements comprising function;
// return dataTypeOfReturnValueIfAny; // If void, return is not needed.
//    }

int i = 0;

void setup() {
  size(420, 420);
  background(64);
  float avg = average3Numbers(14.5, 16.3, 19.4);
  println(avg);
  int fct = factorial(5);
  println(fct);
}

void draw() {
  background(32);
  if (i < 32) {
    println(fibonacci(i));
    i++;
  }
}

float average3Numbers(float a, float b, float c) {
  return (a + b + c) / 3.0;
}

// 2. Functions can call themselves. These are called recursive
//    functions. Be careful using them. A recursive function
//    should always have a base condition: a very simple action
//    which it performs and then quits out instead of calling
//    itself again.
int factorial(int n) {
  // n == 0 is the base case
  if (n == 0) {
    return 1;
  } else {
    return (n * factorial(n - 1));
  }
}

int fibonacci(int n) {
  // n <= 1 is the base case
  if (n <= 1) {
    return n;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}