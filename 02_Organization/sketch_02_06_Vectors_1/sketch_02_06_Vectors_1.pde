// 1. You can think of a vector as a coordinate pair
//    or a vertex.
PVector v1;
PVector v2;

void setup() {
  fullScreen();
  // size(680, 420);
  background(64);
  ellipseMode(RADIUS);
  textAlign(LEFT, TOP);
  textSize(16);

  v1 = new PVector(100, 100);
  v2 = new PVector(400, 200);

  // 3. Each vector has a heading, or degrees of rotation from
  //    y = 0 at the origin.
  println("v1 heading\t\t" + degrees(v1.heading()) + " or PI * " + v1.heading() / PI);
  println("v2 heading\t\t" + degrees(v2.heading()) + " or PI * " + v2.heading() / PI);

  // 3. The angle between two vectors can be calculated like so.
  println("v1 & v2\t\t" + degrees(PVector.angleBetween(v2, v1)));

  // 4. Each vector has a magnitude, or distance from the origin.
  println("\nv1 magnitude\t" + degrees(v1.mag()));
  println("v2 magnitude\t" + degrees(v2.mag()));

  // 5. The distance between two vectors can be calculated like so.
  //    You can easily find the distance between any two
  //    points without having to calculate the rise (y2 - y1),
  //    run(x2 - x1), or doing the Pythogorean theorem (c =
  //    sqrt(rise ^ 2 + run ^ 2). For the original values: 
  //    sqrt ((200 - 100)^2 + (400 - 100)^2) = 316
  println("v1 & v2\t\t" + PVector.dist(v1, v2));
}

void draw() {
  if (mousePressed && mouseButton == LEFT) {
    v1 = new PVector(mouseX, mouseY);
  } else if (mousePressed && mouseButton == RIGHT) {
    v2 = new PVector(mouseX, mouseY);
  }

  background(32);

  // noFill();
  strokeWeight(1);

  // 5. Arcs demonstrate the heading of each individual
  //    vector. The square of 100^2 + 100^2 is 141.42.
  //    You'll notice that the vector's magnitude is the
  //    same as the hypotenuse of a triangle.
  stroke(255, 0, 0);
  fill(255, 0, 0, 27);
  arc(0, 0, v1.mag(), v1.mag(), 0, v1.heading(), PIE);
  
  // The square of 400^2 + 200^2.
  stroke(0, 255, 0);
  fill(0, 255, 0, 27);
  arc(0, 0, v2.mag(), v2.mag(), 0, v2.heading(), PIE);

  stroke(255);
  strokeWeight(2);
  line(v1.x, v1.y, v2.x, v2.y);

  stroke(0, 127, 255);
  strokeWeight(7);
  point(v1.x, v1.y);
  point(v2.x, v2.y);

  // Diagnostic information.
  fill(0, 127, 255);
  text("v1", v1.x, v1.y);
  text("v2", v2.x, v2.y);
  fill(255, 0, 0);
  text(v1.mag(), v1.x / 2.0, v1.y / 2.0);
  fill(0, 255, 0);
  text(v2.mag(), v2.x / 2.0, v2.y / 2.0);
  fill(255, 0, 0);
  text(degrees(v1.heading()) + " deg", v1.mag(), 0);
  fill(0, 255, 0);
  text(degrees(v2.heading()) + " deg", v2.mag(), 0);
  fill(255, 255, 0);
  text(PVector.dist(v1, v2), v1.x + (v2.x - v1.x) / 2.0, v1.y + (v2.y - v1.y) / 2.0);
  text(degrees(PVector.angleBetween(v1,v2)) + " deg", 3, 3);
}