class Capsule {
  PImage img;
  float x, y, 
    angle, rotationSpeed, mouseFollow;

  Capsule() {
    // Load the image from the /data folder.
    img = loadImage("iris.png");
    // Set the (x, y) coordinate to the center of the screen.
    x = width / 2.0;
    y = height / 2.0;
    rotationSpeed = random(0.01, 0.05);
    mouseFollow = random(0.01, 0.05);
  }

  // A second constructor, which gives the user more options of where to place the image.
  Capsule(float _x, float _y) {
    img = loadImage("iris.png");
    x = _x;
    y = _y;
    rotationSpeed = random(0.01, 0.05);
    mouseFollow = random(0.01, 0.05);
  }

  void show() {
    pushMatrix();
    // Make the (x, y) coordinate pair the pivot around which the image rotates.
    translate(x, y);
    // Rotate the image around the pivot by the angle.
    rotate(angle);
    // Make the image translucent by tinting it.
    tint(255, 194);
    // Make it so the image draws out from the center rather than from the topleft corner.
    imageMode(CENTER);
    image(img, 0, 0, img.width, img.height);
    popMatrix();
  }

  void move() {
    // Move the image's location toward the mouse's location multiplied
    // by a delay (linear interpolation).
    x += (mouseX - x) * mouseFollow;
    y += (mouseY - y) * mouseFollow;
  }

  void interact() {
    // If the mouse is pressed, increase the angle.
    if (mousePressed) {
      angle += rotationSpeed;
    }
  }
}