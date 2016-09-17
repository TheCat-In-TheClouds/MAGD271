// 1. We'll go into depth on Vectors later. Basically, they're
//    a way to bundle x and y coordinates together into one
//    variable. When x and y are considered together, we can
//    perform cool and easy calculations about the magnitude
//    (length) and direction (angle) of points in space.
PVector deltaMouse = new PVector(width / 2.0, height / 2.0);
PVector pDeltaMouse = new PVector(width / 2.0, height / 2.0);

// 2. float is short for floating point. These are real numbers.
//    Keep floats in mind especially when dividing, because n / 2
//    results in integer division compared to n / 2.0.
float maxDMag = 0.0;

int mouseHeartBeat = 0;
int mouseWheel = 0;

void setup() {
  size(680, 420);
  // fullScreen();
  background(32);
  noCursor();
  rectMode(CENTER);
  maxDMag = sqrt(width * height);
}

void draw() {
  noStroke();
  fill(32, 32, 32, 20);
  rect(width / 2.0, height / 2.0, width, height);

  // 3. pmouseX and pmouseY record the mouse's position at
  //    the previous frame. When pmouseX and pmouseY are
  //    subtracted from mouseX and mouseY, you can get a
  //    beat on the speed of the mouse.
  pDeltaMouse = deltaMouse.copy();
  deltaMouse = new PVector(mouseX - pmouseX, mouseY - pmouseY);

  // 4. The magnitude of a vector is its length expressed as
  //    a positive value. The delta for either x or y could
  //    be negative depending on which direction the mouse is
  //    moving. Used in conjunction with the map function, the
  //    length of the vector can be transformed into height.  
  strokeWeight(1);
  stroke(0, 127, 255);
  line(mouseHeartBeat, height, mouseHeartBeat, height - map(deltaMouse.mag(), 0, maxDMag, 0, height));
  mouseHeartBeat = (mouseHeartBeat + 1) % width;

  strokeWeight(1);
  stroke(0, 255, 125);
  line(mouseHeartBeat - 1, height, mouseHeartBeat - 1, height - map(PVector.sub(pDeltaMouse, deltaMouse).mag() / 16.6667, 0, 60, 0, height));

  // 5. The difference between mouse and pmouse can be visually
  //    expressed in a line segment.
  strokeWeight(2);
  stroke(255, map(deltaMouse.mag(), 0, 300, 0, 255), 0, 127);
  line(pmouseX, pmouseY, mouseX, mouseY);

  // 6. Within the mousePressed condition check, you can look
  //    to see which mouseButton is being pressed and respond
  //    accordingly, using right for alt functionality.
  if (mousePressed) {
    noStroke();
    if (mouseButton == LEFT) {
      fill(64, 64, 0, 15);
      rect(width / 4.0, height / 2.0, width / 2.0, height);
    } else if (mouseButton == RIGHT) {
      fill(0, 64, 64, 15);
      rect(width * 3 / 4.0, height / 2.0, width / 2.0, height);
    } else if (mouseButton == CENTER) {
      fill(15, 32, 15, 15);
      rect(width / 2.0, height / 2.0, width / 2.0, height);
    }
  }

  if (mouseWheel != 0) {
    stroke(255, 54);
    strokeCap(SQUARE);
    strokeWeight(2);
    float y2 = height / 2.0 + (50 * mouseWheel);
    line(width / 2.0, height / 2.0, width / 2.0, y2);
    fill(255, 54);
    triangle(width / 2.0, y2 + (20 * mouseWheel), width / 2.0 + 10, y2, width / 2.0 - 10, y2);
  }
}

// 7. The mouseWheel() event function can receive a parameter
//    which you can use to get the direction of the mouse scroll.
//    Scrolling up = -1, Scrolling down = 1. If you're familiar
//    with Java, see the reference:
//    https://docs.oracle.com/javase/7/docs/api/java/awt/event/MouseEvent.html
void mouseWheel(MouseEvent me) {
  mouseWheel = me.getCount();
}

void mousePressed() {
  // LEFT = 37
  // RIGHT = 39
  // CENTER = 3
  println(mouseButton + " pressed.");

  noStroke();
  fill(255, 255, 0, 240);
  rect(mouseX, mouseY, 30, 30, 5);
}

void mouseDragged() {
  println(mouseButton + " dragged.");

  noStroke();
  fill(255, 204, 0, 240);
  ellipse(mouseX, mouseY, 5, 5);
}

void mouseReleased() {
  println(mouseButton + " released.");

  noStroke();
  fill(255, 127, 0, 240);
  rect(mouseX, mouseY, 30, 30, 5);
}