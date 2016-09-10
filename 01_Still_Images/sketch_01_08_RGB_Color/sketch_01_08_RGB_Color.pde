// 1. In Processing's menu bar, go to Tools > Color Selector for
//    a tool similar to those found in photo editing software.
//    It will give you the color's numerical values in Red-Green-Blue
//    and Hue-Saturation-Brightness representation, as well as
//    how to represent the color using hexadecimal notation.

void setup() {
  size(680, 420);

  // 2. When only one argument is supplied to functions such as
  //    fill, stroke, tint and background they are treated as
  //    a grayscale value ranging from 0 to 255, where 0 is black
  //    and 255 is white.
  background(255);
  fill(0);
  ellipse(75, 37.5, 75, 75);
  fill(30);
  ellipse(75, 75, 75, 75);
  fill(60);
  ellipse(75, 112.5, 75, 75);
  fill(90);
  ellipse(75, 150, 75, 75);
  fill(120);
  ellipse(75, 187.5, 75, 75);
  fill(150);
  ellipse(75, 225, 75, 75);
  fill(180);
  ellipse(75, 262.5, 75, 75);
  fill(210);
  ellipse(75, 300, 75, 75);
  fill(240);
  ellipse(75, 337.5, 75, 75);
  fill(255);
  ellipse(75, 375, 75, 75);

  // 3. When two arguments are supplied, the second is treated
  //    as alpha, or transparency, where 255 is opaque and 0 is
  //    transparent.
  
  // This red rectangle serves as relief to better demonstrate
  // the decreasing alpha.
  fill(255, 0, 0);
  rect(112.75, 0, 75, 412.5);

  fill(0, 255);
  ellipse(150, 37.5, 75, 75);
  fill(30, 240);
  ellipse(150, 75, 75, 75);
  fill(60, 210);
  ellipse(150, 112.5, 75, 75);
  fill(90, 180);
  ellipse(150, 150, 75, 75);
  fill(120, 150);
  ellipse(150, 187.5, 75, 75);
  fill(150, 120);
  ellipse(150, 225, 75, 75);
  fill(180, 90);
  ellipse(150, 262.5, 75, 75);
  fill(210, 60);
  ellipse(150, 300, 75, 75);
  fill(240, 30);
  ellipse(150, 337.5, 75, 75);
  fill(255, 0);
  ellipse(150, 375, 75, 75);

  noStroke();
}

void draw() {
  // 4. colorMode(RGB, redMax, greenMax, blueMax, alphaMax);
  //    colorMode(HSB, hueMax, saturationMax, brightnessMax, alphaMax);
  //    The colorMode function allows you to change the manner in
  //    which the parameters for fill, stroke, etc. are interpreted,
  //    as well as the range. This allows you to easily express other
  //    ranges with a color.
  colorMode(RGB, 255, 255, 255, 100);

  // PRIMARY COLORS
  // Red, with an alpha of 25%
  fill(255, 0, 0, 25);
  ellipse(width * 2 / 3.0 - 75, height / 4.0, 150, 150);

  // Green
  fill(0, 255, 0, 25);
  ellipse(width * 2 / 3.0, height / 4.0, 150, 150);

  // Blue
  fill(0, 0, 255, 25);
  ellipse(width * 2 / 3.0 + 75, height / 4.0, 150, 150);

  // SECONDARY COLORS
  // Cyan
  fill(0, 255, 255, 25);
  ellipse(width * 2 / 3.0 - 37.5, height * 3 / 4.0, 75, 75);

  // Magenta
  fill(255, 0, 255, 25);
  ellipse(width * 2 / 3.0, height * 3 / 4.0, 75, 75);

  // Yellow
  fill(255, 255, 0, 25);
  ellipse(width * 2 / 3.0 + 37.5, height * 3 / 4.0, 75, 75);

  // 5. The map function can be used to make the color of an
  //    element respond to variables such as the mouse's position.
  fill(map(mouseX, 0, width, 0, 255), 
    map(mouseY, 0, height, 0, 255), 
    map(mouseX, width, 0, 0, 255), 
    map(mouseY, height, 0, 0, 255));
  ellipse(width * 2 / 3.0 - 30, height - 20, 40, 40);

  fill(map(mouseY, height, 0, 0, 255), 
    map(mouseX, 0, width, 0, 255), 
    map(mouseY, 0, height, 0, 255), 
    map(mouseX, width, 0, 0, 255));
  ellipse(width * 2 / 3.0 - 10, height - 20, 40, 40);

  fill(map(mouseX, width, 0, 0, 255), 
    map(mouseY, height, 0, 0, 255), 
    map(mouseX, 0, width, 0, 255), 
    map(mouseY, 0, height, 0, 255));
  ellipse(width * 2 / 3.0 + 10, height - 20, 40, 40);

  fill(map(mouseY, 0, height, 0, 255), 
    map(mouseX, width, 0, 0, 255), 
    map(mouseY, height, 0, 0, 255), 
    map(mouseX, 0, width, 0, 255));
  ellipse(width * 2 / 3.0 + 30, height - 20, 40, 40);
}