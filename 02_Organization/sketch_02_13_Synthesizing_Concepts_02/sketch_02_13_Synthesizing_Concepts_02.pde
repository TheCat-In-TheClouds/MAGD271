// Variables to track top ellipse.
color topCurrentColor;
color topTargetColor;

PVector topCurrentPos;
PVector topOriginPos;
PVector topDestPos;
PVector topTargetPos;
PVector topScale;

float topSpeed;

// Variables to track bottom ellipse.
color bottomCurrentColor;
color bottomTargetColor;

PVector bottomCurrentPos;
PVector bottomOriginPos;
PVector bottomDestPos;
PVector bottomTargetPos;
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

  topCurrentColor = changeColor(topCurrentColor, topSpeed, mouseX, width);
  topCurrentPos = moveTowards(topCurrentPos, topOriginPos, topDestPos, topSpeed, mouseX, width);
  dot(topCurrentColor, topCurrentPos, topScale);
  measure(topOriginPos, topDestPos);

  bottomCurrentColor = changeColor(bottomCurrentColor, topSpeed, mouseY, height);
  bottomCurrentPos = moveTowards(bottomCurrentPos, bottomOriginPos, bottomDestPos, bottomSpeed, mouseY, height);
  dot(bottomCurrentColor, bottomCurrentPos, bottomScale);
  measure(bottomOriginPos, bottomDestPos);
}

color changeColor(color current, float speed, float value, float upperBound) {
  float r = red(current);
  float g = green(current);
  float b = blue(current);

  if (r == 255) {
    b = map(value, 0, upperBound, 0, 255);
  } else if (g == 255) {
    r = map(value, 0, upperBound, 0, 255);
  } else if (b == 255) {
    g = map(value, 0, upperBound, 0, 255);
  }
  return lerpColor(current, color(r, g, b), speed);
}

PVector moveTowards(PVector current, 
  PVector origin, PVector destination, 
  float speed, float value, float upperBound) {
  PVector goal = new PVector(map(value, 0, upperBound, origin.x, destination.x), 
    current.y); 
  return PVector.lerp(current, goal, speed);
}

void dot(color fill, PVector position, PVector scale) {
  noStroke();
  fill(fill);
  ellipse(position, scale);
}

void measure(PVector origin, PVector destination) {
  stroke(255);
  strokeWeight(1);
  line(PVector.add(origin, new PVector(0, 20)), 
    PVector.add(destination, new PVector(0, 20)));
  line(PVector.add(origin, new PVector(0, 17)), 
    PVector.add(origin, new PVector(0, 20)));
  line(PVector.add(destination, new PVector(0, 17)), 
    PVector.add(destination, new PVector(0, 20)));
}