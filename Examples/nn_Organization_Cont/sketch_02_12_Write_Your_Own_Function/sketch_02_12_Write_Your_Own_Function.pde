// 1. Anatomy of a function:
//    dataTypeOfReturnValueIfAny functionName(parameter1, parameter2) {
// statements comprising function;
// return dataTypeOfReturnValueIfAny; // If void, return is not needed.
//    }

// 2. That's the definition of a function. A function that is defined
//    but not called is of no use, so don't forget to call it. Think
//    about whether you will be calling functions in draw or in setup
//    when you write them.

int i = 0;
int fib;

void setup() {
  size(420, 420);
  background(64);

  float avg = averageNumbers(14.5, 16.3, 19.4);
  println("avg 1 " + avg);
  avg = averageNumbers(14.5, 89.4, 54.3, 23.4, 20.3);
  println("avg 2 " + avg);

  int fct = factorial(5);
  println("fct " + fct);
}

void draw() {
  background(32);

  if (i < 32) {
    fib = fibonacci(i);
    println(fib);
    i++;
  }

  redDots();

  dots(35, 64, 64, 0.75);
  dots(65, 128, 128, 1.25);
  dots(105, 300, 64, 1.5);
}

// 3. Abstraction, or generalization is very important to programming.
//    A function to average numbers is not much use if it can only average
//    two numbers. As you can see in the improved averageNumbers function
//    below, there is a trade-off between simplicity and versatility.
float averageNumbers(float a, float b) {
  return (a + b) / 2.0;
}

// 4. Notice that different functions can have the same name if
//    their signatures are different. Namely, they take different
//    lists of information. Notice that you can use varargs, a
//    variable number of arguments, which are indicated by the
//    ellipsis, which will be treated 
float averageNumbers(float... ns) {
    int size = ns.length;
  if (size == 0) {
    return 0;
  } else {
    float sum = 0;
    for(int i = 0; i < size; ++i) {
      sum += ns[i];
    }
    return sum / size;
  }
}

// 5. Functions can call themselves. These are called recursive
//    functions. Be careful using them. A recursive function
//    should always have a base condition: a very simple action
//    which it performs and then quits out instead of calling
//    itself again. If that base condition is not properly
//    written, the recursive function could call itself forever.
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

// 5. void means that redDots doesn't return any information
//    once it is finished. Nor does it need any info.
void redDots() {
  pushStyle();
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  fill(0, 100, 100);
  ellipse(210, 210, 70, 70);
  fill(0, 80, 100);
  ellipse(212.5, 212.5, 65, 65);
  fill(0, 60, 100);
  ellipse(215, 215, 60, 60);
  fill(0, 40, 100);
  ellipse(217.5, 217.5, 50, 50);
  fill(0, 100, 100);
  ellipse(270, 210, 30, 30);
  popStyle();
}

// 6. Drafting a function is like drafting an essay in a
//    writing class. Your first draft is rarely your
//    best. The above function allows us to quickly and
//    easily draw some circles, but we cannot add
//    any variation. If we add some parameters to our
//    function's signature, we'll be able to get that variety.
void dots(float hue, float x, float y, float scalar) {
  pushStyle();
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  fill(hue, 100, 100);
  ellipse(x, y, 70 * scalar, 70 * scalar);
  fill(hue, 80, 100);
  ellipse(x + (2.5 * scalar), y + (2.5 * scalar), 65 * scalar, 65 * scalar);
  fill(hue, 60, 100);
  ellipse(x + (5 * scalar), y + (5 * scalar), 60 * scalar, 60 * scalar);
  fill(hue, 40, 100);
  ellipse(x + (7.5 * scalar), y + (7.5 * scalar), 50 * scalar, 50 * scalar);
  fill(hue, 100, 100);
  ellipse(x + (70 * scalar), y, 30 * scalar, 30 * scalar);
  popStyle();
}