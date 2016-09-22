// 1. We also have booleans, which can be true or false.
boolean lightSwitch = false;

void setup() {
  size(420, 420);
  background(64);
  frameRate(1);
  noStroke();

  // 2. Comparisons between numbers can be true or false,
  //    so we can assign them to a boolean.
  lightSwitch = 3 < 5;
  println("3 < 5 is " + lightSwitch);

  // 3. Comparisons can include == (is equal to), != (is not
  //    equal to), > (is greater than), >= (is greater than or
  //    equal to), < (is less than), <= (is less than or
  //    equal to).
  lightSwitch = 5 == 7;
  println("5 == 7 is " + lightSwitch);
  lightSwitch = 10 != 3;
  println("10 != 3 is " + lightSwitch);
  lightSwitch = 80 < 4;
  println("80 < 4 is " + lightSwitch);
  lightSwitch = 40 > 4;
  println("40 > 4 is " + lightSwitch);  
  lightSwitch = 13 <= 15;
  println("13 <= 15 is " + lightSwitch);
  lightSwitch = 54 >= 64; 
  println("54 >= 64 is " + lightSwitch);
  
  // 4. Comparisons can be combined. So true && true is true,
  //    true || false is true, as is false || true, since ||
  //    stands for 'or'.
  println(13 <= 15 && 54 >= 64);
}

void draw() {
  background(32);
  
  // 3. Every frame, we assign lightSwitch the opposite,
  //    or negation, of itself. So if lightSwitch is true,
  //    then it becomes false, and vice-versa.
  lightSwitch = !lightSwitch;
  // println(lightSwitch);
  
  if(lightSwitch) {
    fill(255, 255, 0);
    ellipse(210, 210, 150, 150);
  }
}