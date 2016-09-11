int x1 = 100;
int x2 = 300;
int y1 = 200;
int y2 = 250;
float cornerRounding = 5;
int centerX = x1 + (x2 - x1) / 2;
int centerY = y1 + (y2 - y1) / 2;
PFont fontB;
String label = "Hello!";

// 1. This variable will be treated like a switch that is
//    turned on or off by pressing on the button.
boolean triggered = false;

void setup() {
  size(680, 420);
  background(32);
  rectMode(CORNERS);
  noStroke();
  textAlign(CENTER, CENTER);
  fontB = createFont("Source Code Pro", 16);
  textFont(fontB);
}

void draw() {
  background(32);
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {

    // 2. Do you want the button to do something once when pressed?
    //    What if the user keeps holding the mouse down over the button,
    //    should it keep triggering that action? If yes, then use the
    //    true or false conditional in the draw function. If no, then
    //    see the void mousePressed() and void mouseReleased() below.
    if (mousePressed) {
      fill(0, 255, 0);
      ellipse(width - 75, height - 75, 50, 50);
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

  if (triggered) {
    fill(255, 255, 0);
    ellipse(width - 75, height - 300, 50, 50);
  }
}

void mousePressed() {
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    fill(0, 0, 255);
    ellipse(width - 75, height - 150, 50, 50);

    // 3. The exclamation point is used for negation. If triggered is true,
    //    It is assigned its opposite, false. If triggered is false, it is
    //    assigned its opposite, true.
    triggered = !triggered;
  }
}

void mouseReleased() {
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    fill(255, 0, 0);
    ellipse(width - 75, height - 225, 50, 50);
  }
}