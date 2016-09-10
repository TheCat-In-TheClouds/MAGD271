PImage corfu;

void setup() {
  size(420, 420);
  corfu = loadImage("corfu.png");
}

void draw() {
  background(32);
  
  // 1. The image() function following this interprets the four
  //    arguments following the img file as the top-left corner
  //    and bottom-right corner.
  imageMode(CORNERS);
  
  // 2. image(img, topLeftX, topLeftY, bottomRightX, bottomRightY);
  image(corfu, 0, 0, 420, 420);
  
  // 3. Changes the way the second two arguments given to the image()
  //    function are interpreted. The image() function following this
  //    now interprets x and y as the image center, not the top-left corner.
  imageMode(CENTER);
  
  // 4. image(img, centerX, centerY, width, height);
  image(corfu, 210, 210, 150, 267);
  
  // 5. The default imageMode is CORNER.
  imageMode(CORNER);
  
  // 6. Uncomment to see more images.
  imageMode(CORNERS);
  image(corfu, -75, 0, 75, 420);
  image(corfu, 345, 0, 425, 420);
}