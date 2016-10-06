int x1 = 100;
int x2 = 300;
int y1 = 200;
int y2 = 250;

float cornerRounding = 5;
float centerX = x1 + (x2 - x1) / 2.0;
float centerY = y1 + (y2 - y1) / 2.0;

String label = "Hello!";

// 1. This variable will be treated like a switch that is
//    turned on or off by pressing on the button.
boolean toggle = false;

PFont fontB;

PVector mPressed = new PVector();

void setup() {
  size(680, 420);
  background(32);
  rectMode(CORNERS);
  noStroke();
  textAlign(CENTER, CENTER);
  fontB = createFont("Source Code Pro Bold", 16);
  textFont(fontB);
}

void draw() {
  background(32);
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {

    if (mousePressed) {
      fill(0, 54, 255);
      ellipse(width - 75, 25, 50, 50);
      textSize(14);
      fill(255);
      text("IN DRAW()", width - 75, 25);
    }

    textSize(16);
    fill(145);
  } else {
    textSize(14);
    fill(120);
  }
  rect(x1, y1, x2, y2, cornerRounding);
  fill(0);
  text(label, centerX - 1, centerY + 1);
  fill(255);
  text(label, centerX, centerY);

  // 2. If toggle is true, then a yellow dot appears.
  if (toggle) {
    fill(255, 127, 0);
    ellipse(width - 75, height - 300, 50, 50);
    textSize(14);
    fill(255);
    text("TOGGLE", width - 75, height - 300);
  }
}

void mousePressed() { // GREEN
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    fill(0, 240, 0);
    ellipse(width - 75, height - 75, 50, 50);
    textSize(14);
    fill(255);
    text("PRESSED", width - 75, height - 75);

    // 4. The exclamation point is used for negation. If toggle is true,
    //    It is assigned its opposite, false. If toggle is false, it is
    //    assigned its opposite, true.
    toggle = !toggle;
  }
}

void mouseDragged() { // MAGENTA
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    fill(255, 0, 127);
    ellipse(width - 75, height - 150, 50, 50);
    textSize(14);
    fill(255);
    text("DRAGGED", width - 75, height - 150);
  }
}

void mouseReleased() { // RED
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    fill(255, 0, 0);
    ellipse(width - 75, height - 225, 50, 50);
    textSize(14);
    fill(255);
    text("RELEASED", width - 75, height - 225);
  }
}