int screenCapIncr = 0;

void setup() {
  size(420, 420);
  background(32);
  noStroke();
}

void draw() {
  fill(32, 32, 32, 127);
  rect(0, 0, width, height);
  fill(random(127, 255), random(127, 255), random(127, 255), random(127, 255)); 
  ellipse(random(0, width), random(0, height), 100, 100);

  if (mousePressed && mouseButton == RIGHT) {
    saveFrame("frames/######.png");
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    save("stills/" + screenCapIncr + ".png");
    screenCapIncr++;
  }
}