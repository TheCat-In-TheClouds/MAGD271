Button a, b, c;

void setup() {
  size(680, 420);
  background(64);
  rectMode(CENTER);
  
  a = new Button(width / 4.0, height / 2.0, 50, "Alpha");
  b = new Button(width / 2.0, height / 2.0, 62, "Bravo");
  c = new Button(width * 3 / 4.0, height / 2.0, 75, "Charlie");

  // 1. Customizing the c button's colors since it is acting as a 'ring'
  //    rather than a button.
  c.noFill = true;
  c.strokeWeight = 15;
  c.activeStrokeColor = color(255, 255, 127);
  c.hoverStrokeColor = color(127, 255, 255);
  c.inactiveStrokeColor = color(255, 127, 255);
}

void draw() {
  background(32);
  a.update();
  b.update();
  c.update();

  if (a.toggle) {
    fill(255, 0, 0);
    rect(width / 4.0, height - 30, 20, 20);
  }

  if (b.toggle) {
    fill(255, 0, 0);
    rect(width / 2.0, height - 30, 20, 20);
  }

  if (c.toggle) {
    fill(255, 0, 0);
    rect(width * 3 / 4.0, height - 30, 20, 20);
  }

  if (a.bounds() || b.bounds() || c.bounds()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void mouseReleased() {
  if (a.bounds()) {
    a.toggle();
  } else if (b.bounds()) {
    b.toggle();
  } else if (c.bounds()) {
    c.toggle();
  }
}