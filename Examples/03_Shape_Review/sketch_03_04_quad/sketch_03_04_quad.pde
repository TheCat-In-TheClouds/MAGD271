void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  background(32);
  noStroke();

  fill(0, 255, 0, 127);
  quad(width * 0.5, 0, width, height * 0.5, width * 0.5, height, 0, height * 0.5); 

  fill(255, 0, 0, 127);
  quad(width * 0.125, height * 0.3125, width * 0.8125, height * 0.125, width * 0.5, height * 0.6125, width * 0.25, height * 0.75);

  fill(0, 0, 255, 127);
  quad(width * 0.85, height * 0.625, width * 0.43, height * 0.4, width * 0.65, height * 0.6125, width * 0.8, height * 0.95);

  fill(255, 255, 0, 127);
  quad(width * 0.5, 0, width, height * 0.5, width * 0.5, height, width * 0.75, height * 0.5);
}