// Green Circle
float x1 = 210;
float y1 = 75;
float radius1 = 50;

// Blue ring
float x2 = 210;
float y2 = 275;
float radius2 = 100;
float strokeWeight = 50;

void setup() {
  size(420, 420);
  ellipseMode(RADIUS);
}

void draw() {
  background(32);

  // 1. Because we are changing whether or not we use stroke
  //    or fill between displaying the two circles, we use
  //    pushStyle() and popStyle() to enclose those styles.
  pushStyle();
  noStroke();
  // 2. This is the distance formula. Alternatively, you can
  //    use the dist(x1, y1, x2, y2) function.
  // if(sqrt(sq(x - mouseX) + sq(y - mouseY)) < radius) {
  if (dist(x1, y1, mouseX, mouseY) < radius1) {
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  ellipse(x1, y1, radius1, radius1);
  popStyle();

  pushStyle();
  noFill();
  strokeWeight(50);
  // 3. This distance formula is complicated by the stroke. Half of the
  //    stroke's thickness is drawn inside the circle's radius, half is
  //    drawn beyond the circle's radius. Hence the comparison must check
  //    for an additional half the strokeWeight. The distance formula is
  //    complicated even further by the fact that we also have to check if
  //    the mouse is greater than the radius of the donut hole. Since it
  //    is expensive to calculate the distance and we don't want to do it
  //    twice every frame, we assign a variable d to remember it.
  float d = dist(x2, y2, mouseX, mouseY);
  if (d < radius2 + (strokeWeight / 2.0) &&
    d > radius2 - (strokeWeight / 2.0)) {
    stroke(255, 255, 0);
  } else {
    stroke(0, 127, 255);
  }
  ellipse(x2, y2, radius2, radius2);
  popStyle();
}