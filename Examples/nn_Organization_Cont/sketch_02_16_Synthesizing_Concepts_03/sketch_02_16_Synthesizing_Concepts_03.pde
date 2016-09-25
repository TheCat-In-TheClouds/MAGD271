MappedDot top;
MappedDot bottom;

MappedDot deltaY;
MappedDot deltaX;

void setup() {
  size(420, 640);
  background(64);
  top = new MappedDot(color(0, 255, 0), 
    new PVector(width / 2.0, height / 5.0), 
    new PVector(30, 30), 0.0125, 4.5);

  bottom = new MappedDot(color(255, 0, 0), 
    new PVector(width / 2.0, height / 3.0), 
    new PVector(30, 30), 0.025, 2.75);

  deltaY = new MappedDot(color(0, 255, 255), 
    new PVector(width / 2.0, height / 2.0), 
    new PVector(25, 25), 0.0105, 2);

  deltaX = new MappedDot(color(255, 0, 255), 
    new PVector(width / 2.0, height / 1.5), 
    new PVector(25, 25), 0.0105, 1.125);

}

void draw() {
  background(32);
  noStroke();
  
  top.draw(mouseX, width);
  bottom.draw(mouseY, height);
  deltaY.draw(abs(mouseY - pmouseY), 150);
  deltaX.draw(abs(mouseX - pmouseX), 150);
  
}