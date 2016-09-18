// 4. map(float value, float originLowerBound, float originUpperBound,
//                     float targetLowerBound, float targetUpperBound);
// Map takes a value from one range and returns a corresponding value
// in a different range. If we want an image to be rescaled in response
// to user input while maintaining its aspect ratio, we can use the map
// function to make sure height keeps pace with width or vice versa.

void setup() {
  size(420, 640);
  background(64);
}

void draw() {

  background(32);
  noStroke();
  fill(map(mouseY, 0, height, 0, 255), 255, 0); 
  ellipse(map(mouseY, 0, height, width / 2.0 - 75, width / 2.0 + 75), height / 5.0, 30, 30);
  stroke(255);
  line(width / 2.0 - 75, height / 5.0 + 20, width / 2.0 + 75, height / 5.0 + 20);
  
  // Pips on the end points of the line above to better illustrate.
  line(width / 2.0 - 75, height / 5.0 + 17, width / 2.0 - 75, height / 5.0 + 20);
  line(width / 2.0 + 75, height / 5.0 + 17, width / 2.0 + 75, height / 5.0 + 20);

  noStroke();
  fill(255, 0, map(mouseX, 0, width, 0, 255));
  ellipse(map(mouseX, 0, width, width / 2.0 - 125, width / 2.0 + 125), height / 3.0, 30, 30);
  stroke(255);
  line(width / 2.0 - 125, height / 3.0 + 20, width / 2.0 + 125, height / 3.0 + 20);
  
  // Pips on the end points of the line above to better illustrate.
  line(width / 2.0 - 125, height / 3.0 + 17, width / 2.0 - 125, height / 3.0 + 20);
  line(width / 2.0 + 125, height / 3.0 + 17, width / 2.0 + 125, height / 3.0 + 20);

  noStroke();
  fill(0, map(millis(), 0, 30000, 0, 255), 255);
  rect(0, height - 20, map(millis(), 0, 30000, 0, width), height - 20);
}