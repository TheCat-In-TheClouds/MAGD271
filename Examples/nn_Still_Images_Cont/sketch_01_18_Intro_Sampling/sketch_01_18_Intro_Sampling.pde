PImage berlin;

void setup() {
  size(680, 420);
  noStroke();
  ellipseMode(RADIUS);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  berlin = loadImage("berlin.png");
  berlin.resize(0, 420);
}

void draw() {  
  // 1. Instead of using a background, in draw, we'll use
  //    a translucent rect the size of the sketch. This way,
  //    movements will register for a while, then fade away.
  fill(0, 0, 100, 1);
  rect(0, 0, width, height);
  
  // 2. Instead of drawing the image directly, you can sample from it.
  // image(berlin, 0, 0, width, height);
  
  // 3. berlin.get(x, y) gets the color of the pixel at the
  //    x and y coordinate in the source image. The color
  //    variable stores color information in a single element.
  color berlinPixel = berlin.get(mouseX, mouseY);
 
  // 4. We can use the hue(color), saturation(color),
  //    brightness(color), red(color), green(color) and blue(color)
  //    functions to extract information from our source pixel
  //    and then manipulate that information.
  float hue = hue(berlinPixel);
  hue = (hue + 0.1) % 360;
  // float sat = saturation(berlinPixel);
  // float bri = brightness(berlinPixel);
  
  // 5. Instead of working with the color as is, we can make a
  //    new one.
  // fill(berlinPixel);
  fill(color(hue, 100, 100));
  ellipse(mouseX, mouseY, 10, 10);
}