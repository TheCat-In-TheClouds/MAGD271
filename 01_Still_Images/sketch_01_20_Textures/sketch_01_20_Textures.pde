// 1. See https://processing.org/examples/star.html for how to draw a star.
PImage poseidon;

float radius1 = 50;
float radius2 = 90;
float angle = TWO_PI / 5.0;
float halfAngle = angle / 2.0;

void setup() {
  //rsize(680, 420, P2D);
  fullScreen(P2D);
  noCursor();
  background(32);
  noStroke();
  poseidon = loadImage("poseidon.png");
}

void draw() {

  fill(32, 32, 32, 5);
  rect(0, 0, width, height);

  pushMatrix();
  translate(mouseX, mouseY);
  beginShape();
  tint(255, 0, 0, 54);
  // 2. Within beginShape(), you can feed the texture() function a PImage.
  texture(poseidon);
  for (float a = 0; a < TWO_PI; a+= angle) {
    // 3. This means that the last 2 parameters of the vertices are the (u, v) coordinates.
    vertex(cos(a) * radius2, sin(a) * radius2, a * 254, a * 143);
    vertex(cos(a + halfAngle) * radius1, sin(a + halfAngle) * radius1, random(0, 800), random(0, 450));
  }
  endShape(CLOSE);
  popMatrix();

  radius1 = (radius1 + 1) % 170;
  radius2 = (radius2 + 1) % 340;
}