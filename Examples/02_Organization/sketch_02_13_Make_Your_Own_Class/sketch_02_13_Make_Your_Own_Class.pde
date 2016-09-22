// 1. It takes a lot of shapes to draw a car. A car
//    could be one of many colors, the wheels could
//    be of certain sizes, etc. So let's not draw it
//    in our main class. Let's draw it in a class of
//    its own, then just create a car here.

// 2. Like any other variable, we create a variable
//    of the data type of the class.
Car prolechariot;
Car mercedes;

void setup() {
  size(680, 420);
  background(64);

  // 3. We assign the result of constructing a car
  //    object to the variable.
  prolechariot = new Car();
  
  // 4. Multiple constructors give us options when
  //    customizing the default values of the car.
  mercedes = new Car(new PVector(100, 200),
  new PVector(240, 60),
  color(255, 127, 255));
}

void draw() {
  background(32);
  
  // 4. The car has its own draw() function, which
  //    we will call here by using a dot method.
  prolechariot.draw();
  // mercedes.draw();
}