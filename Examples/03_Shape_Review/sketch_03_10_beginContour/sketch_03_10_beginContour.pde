int wasdX, wasdY, arrowX, arrowY, ijklX, ijklY;

void setup() {
  size(420, 420);
  background(32);
  noCursor();
  noStroke();

  wasdX = int(random(width / 4, width / 2));
  wasdY = int(random(height / 4, height / 2));
  arrowX = int(random(width / 2, width * 3 / 4));
  arrowY = int(random(height / 2, height * 3 / 4));
  ijklX = int(random(width / 2, width / 2));
  ijklY = int(random(height / 2, height / 2));
}

void draw() {
  background(32);
  
  // Reference image
  fill(0, 0, 255, 127);
  ellipse(width * 0.5, height * 0.5, width * 0.75, height * 0.75);
  
  // Begin shape
  
  fill(255, 0, 0, 127);
  beginShape();
  vertex(width * 0.5, 0);
  vertex(width, height * 0.5);
  vertex(width * 0.5, height);
  vertex(0, height * 0.5);
  
  beginContour();
  vertex(mouseX, mouseY);
  vertex(wasdX, wasdY);
  vertex(arrowX, arrowY);
  vertex(ijklX, ijklY);
  endContour();
  endShape(CLOSE);
  
  
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
  textAlign(CENTER, CENTER);
  text("v1 (" + mouseX + ", " + mouseY + ")", mouseX, mouseY);
  text("v2 (" + wasdX + ", " + wasdY + ")", wasdX, wasdY);
  text("v3 (" + arrowX + ", " + arrowY + ")", arrowX, arrowY);
  text("v4 (" + ijklX + ", " + ijklY + ")", ijklX, ijklY);
  fill(255, 85);
  text("Move points with arrow, WASD, IJKL, mouse.", width / 2.0, height - 16);
  popStyle();
}