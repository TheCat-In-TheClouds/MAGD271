// Variables to track top ellipse.
color topCurrentColor;
color topTargetColor;

PVector topOriginPos;
PVector topCurrentPos;
PVector topTargetPos;
PVector topDestPos;
PVector topScale;

float topSpeed;

// Variables to track bottom ellipse.
color bottomCurrentColor;
color bottomTargetColor;

PVector bottomOriginPos;
PVector bottomCurrentPos;
PVector bottomTargetPos;
PVector bottomDestPos;
PVector bottomScale;

float bottomSpeed;

void setup() {
  size(420, 640);
  background(64);

  // Top ellipse
  topCurrentColor = color(0, 255, 0);
  topTargetColor = color(255, 255, 0);

  topCurrentPos = new PVector(width / 2.0, height / 5.0);
  topOriginPos = new PVector(width / 2.0 - 75, height / 5.0);
  topDestPos = new PVector(width / 2.0 + 75, height / 5.0);
  topTargetPos = topDestPos.copy();
  topScale = new PVector(30, 30);
  
  topSpeed = 0.0125;

  // Bottom ellipse
  bottomCurrentColor = color(255, 0, 0);
  bottomTargetColor = color(255, 0, 255);

  bottomCurrentPos = new PVector(width / 2.0, height / 3.0);
  bottomOriginPos = new PVector(width / 2.0 - 125, height / 3.0);
  bottomDestPos = new PVector(width / 2.0 + 125, height / 3.0);
  bottomTargetPos = bottomDestPos.copy();
  bottomScale = new PVector(30, 30);
  
  bottomSpeed = 0.025;
}

void draw() {
  background(32);
  noStroke();

  // Calculations for top ellipse color
  topTargetColor = color(map(mouseY, 0, height, 0, 255), 255, 0);
  topCurrentColor = lerpColor(topCurrentColor, 
    topTargetColor, 
    topSpeed);

  // Calculations for top ellipse position
  topTargetPos = new PVector(map(mouseY, 0, height, topOriginPos.x, topDestPos.x), topCurrentPos.y); 
  topCurrentPos = PVector.lerp(topCurrentPos, 
    topTargetPos, 
    topSpeed);

  // Display for top ellipse
  noStroke();
  fill(topCurrentColor);
  ellipse(topCurrentPos, topScale);

  // Line which provides a measure.
  stroke(255);
  strokeWeight(1);
  line(PVector.add(topOriginPos, new PVector(0, 20)), PVector.add(topDestPos, new PVector(0, 20)));
  line(PVector.add(topOriginPos, new PVector(0, 17)), PVector.add(topOriginPos, new PVector(0, 20)));
  line(PVector.add(topDestPos, new PVector(0, 17)), PVector.add(topDestPos, new PVector(0, 20)));

  // Calculations for bottom ellipse color
  bottomTargetColor = color(255, 0, map(mouseX, 0, width, 0, 255));
  bottomCurrentColor = lerpColor(bottomCurrentColor, 
    bottomTargetColor, 
    bottomSpeed);

  // Bottom for top ellipse position
  bottomTargetPos = new PVector(map(mouseX, 0, width, bottomOriginPos.x, bottomDestPos.x), bottomCurrentPos.y); 
  bottomCurrentPos = PVector.lerp(bottomCurrentPos, 
    bottomTargetPos, 
    bottomSpeed);

  // Display for the bottom ellipse.
  noStroke();
  fill(bottomCurrentColor);
  ellipse(bottomCurrentPos, bottomScale);

  // Line which provides a measure.
  stroke(255);
  strokeWeight(1);
  line(PVector.add(bottomOriginPos, new PVector(0, 20)), PVector.add(bottomDestPos, new PVector(0, 20)));
  line(PVector.add(bottomOriginPos, new PVector(0, 17)), PVector.add(bottomOriginPos, new PVector(0, 20)));
  line(PVector.add(bottomDestPos, new PVector(0, 17)), PVector.add(bottomDestPos, new PVector(0, 20)));
}