PVector center;
float radius;
float strokeWeight;

// 1. Before we've examined instantaneous change in color based on
//    mouse hover, mouse click, etc. Now we need to start animating
//    our color transitions. To do that, we have to begin using a
//    color variable, which we will then use with lerpColor.
color inactive;
color hover;
color current;
// 2. This is where programming meets user interaction design. If
//    it takes too long to fade-in, it is unclear that the user is
//    or isn't over the ring. Too long vs. too short is not only about
//    the time variable below, however. Dramatically different colors
//    need more time to fade in and out.
float fadeTime = 0.05;

PVector mouse;
PVector mPressed;

float dist;

void setup() {
  //fullScreen();
  size(420, 420);

  // 3. Since thinking in terms of the radius of the circle is helpful here,
  //    I'm switching the ellipseMode to radius.
  ellipseMode(RADIUS);

  // 4. With the color selector looking at Hue-Saturation-Brightness in terms
  //    of 0-360, 0-100, 0-100 it helps to set the colorMode as well.
  colorMode(HSB, 360, 100, 100);

  // 5. A vector is a collection of x and y coordinates into one package.
  //    By keeping them together, we can determine length and angle, or
  //    magnitude and direction, and we gain access to many functions which
  //    let us work with circular motion (angleBetween) and animation (lerp).
  center = new PVector(width / 2.0, height / 2.0);
  radius = 100;

  inactive = color(15, 100, 100);
  hover = color(60, 100, 100);
  current = color(15, 100, 100);

  strokeWeight = 50;
  mouse = new PVector();
  mPressed = new PVector();
}

void draw() {
  background(32);

  // 5. Every frame, we need to calculate the distance between the center of
  //    the ring and the mouse. With vectors, we can use PVector.dist(v1, v2);
  mouse = new PVector(mouseX, mouseY);
  dist = PVector.dist(center, mouse);

  // 6. Since we need to contain the noFill, stroke, strokeWeight style settings
  //    for the ring, we place the styling between pushStyle(); and popStyle();
  pushStyle();
  noFill();
  strokeWeight(radius);
  stroke(current);
  ellipse(center.x, center.y, radius, radius);
  popStyle();

  if (dist < radius + strokeWeight && dist > radius - strokeWeight) {
    // 7. lerpColor(currentValue, targetValue, time);
    //    Lerp stands for linear interpolation, it moves a value, whether
    //    it be a spatial position or a color, incrementally towards a target
    //    based on the rate of time.
    current = lerpColor(current, hover, fadeTime);

    if (mousePressed) {
      // 8. We subtract the mouse's position from the center position.
      mouse.sub(center);
      // 9. Normalize converts the distance or magnitude of the vector to
      // a value between 0 and 1, i.e., makes this a unit vector.
      mouse.normalize();
      // 10. We blow that distance back up to a scale of our choosing by
      // multiplying by the radius.
      mouse.mult(radius);
      
      //println(degrees(PVector.angleBetween(center, mouse)));
      //println(degrees(PVector.angleBetween(mouse, mPressed)));
      

      pushStyle();
      noStroke();
      fill(315, 100, 100, 50);
      ellipse(mPressed.x + center.x, mPressed.y + center.y, strokeWeight, strokeWeight);
      fill(270, 100, 100, 100);
      ellipse(mouse.x + center.x, mouse.y + center.y, strokeWeight, strokeWeight);
      popStyle();
    } else {
      
    }
  } else {
    current = lerpColor(current, inactive, fadeTime);
  }
}

// 9. The difference between mousePressed the T/F keyword in draw and
//    mousePressed() { } the function you define below draw() is that
//    code inside if(mousePressed) {  } is like rapidfire, it executes
//    repeatedly when the mouse button is down, while mousePressed
//    is an event that happens only once upon the button being clicked.
void mousePressed() {
  if (dist < radius + strokeWeight && dist > radius - strokeWeight) {
    mPressed = new PVector(mouseX, mouseY);
    mPressed.sub(center);
    mPressed.normalize();
    mPressed.mult(radius);
  }
}