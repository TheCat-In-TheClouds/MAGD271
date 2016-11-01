// Step 2. Class definition
class Mimsy {
  float x, y, radius, red, green, blue, speed;

  // Step 3. Constructor
  // vaguely like setup();
  Mimsy() {
    //x = width / 2.0;
    //y = height / 2.0;
    x = random(0, width);
    y = random(0, height / 2.0);
    radius = random(10, 40);
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    speed = random(2, 5);
  }

  // Step 4. Add functionality
  void show() {
    fill(red, green, blue);
    ellipse(x, y, radius, radius);
  }

  // Animation & Interaction
  void interact() {
    if (mousePressed) {
      y+= speed;
      x+= random(-2, 2);
    }
  }
}