/* This sketch's intended audience is students who are familiar
 and comfortable with variable declaration, nested for loops, 
 */

PImage berlin;

int scale = 10;
int rows = 420 / scale;
int cols = 680 / scale;
color sample;
float hue;
float bri;

void setup() {
  size(680, 420);
  noStroke();
  background(32);
  colorMode(HSB, 360, 100, 100);
  berlin = loadImage("berlin.png");
  berlin.resize(0, 420);
}

void draw() {
  for (int y = 0; y < rows; ++y) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x <= cols; ++x) {
      sample = berlin.get((x-1) * scale, y * scale);
      hue = hue(sample);
      bri = brightness(sample);
      if (mousePressed && mouseButton == LEFT) {
        fill((hue + x) % 360, 100, ((bri + y) % 360) + 15);
        vertex(x * scale, y * scale);
        fill((hue + map(mouseY, 0, height, 0, 75)) % 180, 
          100, 
          (bri + map(mouseX, 0, width, 0, 75)) % 360);
        vertex(x * scale, (y + 1) * scale);
      } else if(mousePressed && mouseButton == RIGHT) {
        fill((hue + x) % 360, 100, ((bri + y) % 360) + 15);
        vertex((x * scale) + random(-40, 40), (y * scale) + random(-40, 40));
        fill((hue + map(mouseY, 0, height, 0, 75)) % 180, 
          100, 
          (bri + map(mouseX, 0, width, 0, 75)) % 360);
        vertex((x * scale) - random(-40, 40), ((y + 1) * scale) - random(-40, 40));
      } else {
        fill(sample);
        vertex(x * scale, y * scale);
        vertex(x * scale, (y + 1) * scale);
      }
    }
    endShape();
  }
}