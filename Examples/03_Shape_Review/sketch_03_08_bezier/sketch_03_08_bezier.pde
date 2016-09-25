int wasdX, wasdY, arrowX, arrowY, ijklX, ijklY;

void setup() {
  size(420, 420);
  background(32);
  noCursor();

  wasdX = int(random(width / 4, width / 2));
  wasdY = int(random(height / 4, height / 2));
  arrowX = int(random(width / 2, width * 3 / 4));
  arrowY = int(random(height / 2, height * 3 / 4));
  ijklX = int(random(width / 2, width / 2));
  ijklY = int(random(height / 2, height / 2));

  textAlign(CENTER, TOP);
  textSize(14);
}

void draw() {
  // background(32);
  fill(32, 32, 32, 54);
  rect(0, 0, width, height);

  pushStyle();
  noFill();
  strokeWeight(1);
  stroke(255, 0, 0);
  line(wasdX, wasdY, mouseX, mouseY);

  stroke(0, 255, 0);
  line(wasdX, wasdY, ijklX, ijklY);
  line(mouseX, mouseY, arrowX, arrowY);

  strokeWeight(2);
  stroke(255);
  bezier(wasdX, wasdY, ijklX, ijklY, arrowX, arrowY, mouseX, mouseY);
  popStyle();

  // Key controls
  if (keyPressed) {
    if (key == 'W' || key == 'w') {
      wasdY--;
    }
    if (key == 'A' || key == 'a') {
      wasdX--;
    }
    if (key == 'S' || key == 's') {
      wasdY++;
    }
    if (key == 'D' || key == 'd') {
      wasdX++;
    }
    if (key == 'I' || key == 'i') {
      ijklY--;
    }
    if (key == 'J' || key == 'j') {
      ijklX--;
    }
    if (key == 'K' || key == 'k') {
      ijklY++;
    }
    if (key == 'L' || key == 'l') {
      ijklX++;
    }
    if (keyCode == UP) {
      arrowY--;
    }
    if (keyCode == DOWN) {
      arrowY++;
    }
    if (keyCode == LEFT) {
      arrowX--;
    }
    if (keyCode == RIGHT) {
      arrowX++;
    }
  }

  // Diagnostic info
  pushStyle();
  fill(255, 255, 0);
  text("a1 (" + wasdX + ", " + wasdY + ")", wasdX, wasdY);
  text("a2 (" + mouseX + ", " + mouseY + ")", mouseX, mouseY);
  text("c1 (" + ijklX + ", " + ijklY + ")", ijklX, ijklY);
  text("c2 (" + arrowX + ", " + arrowY + ")", arrowX, arrowY);
  fill(255, 85);
  text("Move points with arrow, WASD, IJKL, mouse.", width / 2.0, height - 16);
  popStyle();
}