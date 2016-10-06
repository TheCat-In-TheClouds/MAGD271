// 1. This example shows implementations for both rectMode(CENTER)
//    and rectMode(CORNER). Think about how you might do this for
//    other rectModes.
int rectMode = CENTER;

// 2. A draggable object can be made both with and without vectors.
// PVector p, mOffset;
float x, y, mOffsetX, mOffsetY;
float w, h, cornerRounding, 
  left, right, top, bottom, 
  smoothing;

color defaultColor, dragColor, currentColor, targetColor, hoverColor;

void setup() {
  size(680, 420);
  background(64);
  rectMode(rectMode);

  w = 80;
  h = 124;
  cornerRounding = 3.0;

  // 3. Depending on how we draw the rectangle, we may want
  //    to position it differently.
  if (rectMode == CENTER) {
    // p = new PVector(width / 2.0, height / 2.0);
    x = width / 2.0;
    y = height / 2.0;
  } else if (rectMode == CORNER) {
    // p = new PVector(width / 2.0 - w / 2.0, height / 2.0 - h / 2.0);
    x = width / 2.0 - w / 2.0;
    y = height / 2.0 - h / 2.0;
  }

  // 4. Linear interpolation is the process of easing a value's
  //    transition from its present value toward a target value.
  //    This is the smoothing factor. The smaller the decimal (the
  //    larger the value of the divisor of the fraction), the
  //    more sluggish the draggable item will be.
  smoothing = 0.325;

  defaultColor = color(0, 54, 255);
  hoverColor = color(255, 255, 54);
  dragColor = color(255, 54, 255);
  currentColor = defaultColor;
}

void draw() {
  background(32);

  if (mouseX > left && mouseY > top && mouseX < right && mouseY < bottom) {
    if (!mousePressed) {
      targetColor = hoverColor;
    } else {
      targetColor = dragColor;
    }
  } else {
    targetColor = defaultColor;
  }


  currentColor = lerpColor(currentColor, targetColor, smoothing / 3.0);
  fill(currentColor);
  // rect(p.x, p.y, w, h, cornerRounding);
  rect(x, y, w, h, cornerRounding);
}


void mouseDragged() {
  // 5. When checking to see if the mouse is inside the bounds of
  //    a rectangle, 
  if (rectMode == CORNER) {
    left = x;
    right = x + w;
    top = y;
    bottom = y + h;
    mOffsetX = mouseX - w / 2.0;
    mOffsetY = mouseY - h / 2.0;

    //left = p.x;
    //right = p.x + w;
    //top = p.y;
    //bottom = p.y + h;
    //mOffset = new PVector(mouseX - w / 2.0, mouseY - h / 2.0);
  } else if (rectMode == CENTER) {
    left = x - w / 2.0;
    right = x + w / 2.0;
    top = y - h / 2.0;
    bottom = y + h / 2.0;
    mOffsetX = mouseX;
    mOffsetY = mouseY;

    //left = p.x - w / 2.0;
    //right = p.x + w / 2.0;
    //top = p.y - h / 2.0;
    //bottom = p.y + h / 2.0;
    //mOffset = new PVector(mouseX, mouseY);
  }

  if (mouseX > left && mouseY > top && mouseX < right && mouseY < bottom) {
    x = x + smoothing * (mOffsetX - x);
    y = y + smoothing * (mOffsetY - y);
    //p.lerp(mOffset, smoothing);
  }
}