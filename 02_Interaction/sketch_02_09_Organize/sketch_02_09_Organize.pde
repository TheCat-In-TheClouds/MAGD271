/* This sketch's intended audience is students who are familiar
 and comfortable with classes, variable declaration, PVector, class
 inheritance, conditionals, events, fonts.
 */

Button a, b, c;

void setup() {
  size(680, 420);
  background(64);
  a = new Button(10, 10, 90, 40, 5, "Alpha");
  b = new Button(10, 50, 90, 80, 5, "Bravo");
  c = new Button(10, 90, 90, 120, 5, "Charlie");
  noStroke();
}

void draw() {
  background(32);
  a.update();
  b.update();
  c.update();

  if (a.toggle) {
    fill(127, 255, 0, 200);
    ellipse(width * 3 / 4.0, height / 3.0, 500, 500);
  }

  if (b.toggle) {
    fill(255, 127, 0, 200);
    ellipse(width * 3 / 4.0, height / 2.0, 500, 500);
  }

  if (c.toggle) {
    fill(255, 127, 255, 200);
    ellipse(width * 3 / 4.0, height * 2/ 3.0, 500, 500);
  }
  
  if(a.bounds() || b.bounds() || c.bounds()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void mousePressed() {
  if (a.bounds()) {
    println(a + " pressed");
  } else if (b.bounds()) {
    println(b + " pressed");
  } else if (c.bounds()) {
    println(c + " pressed");
  }
}

void mouseReleased() {
  if (a.bounds()) {
    println(a + " released");
    a.toggle();
  } else if (b.bounds()) {
    println(b + " released");
    b.toggle();
  } else if (c.bounds()) {
    println(c + " released");
    c.toggle();
  }
}