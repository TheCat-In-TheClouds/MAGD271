class ButtonRect extends Rect {

  RichString label;
  color activeFillColor = color(255, 255, 127);
  color hoverFillColor = color(0, 255, 127);
  color inactiveFillColor = color(0, 127, 255);
  color activeStrokeColor = color(255);
  color hoverStrokeColor = color(235);
  color inactiveStrokeColor = color(215);
  boolean toggle = false;
  float fadeTime = 0.05;

  ButtonRect(PVector a, PVector b, float cornerRounding, String label, PImage img) {
    super(CORNERS, a, b, img);
    this.cornerRounding = cornerRounding;
    this.label = new RichString(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(PVector a, PVector b, float cornerRounding, String label) {
    super(CORNERS, a, b);
    this.cornerRounding = cornerRounding;
    this.label = new RichString(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(PVector a, PVector b, float cornerRounding) {
    super(CORNERS, a, b);
    this.cornerRounding = cornerRounding;
    this.label = new RichString("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(PVector a, PVector b) {
    super(CORNERS, a, b);
    this.cornerRounding = 5;
    this.label = new RichString("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(float a, float b, float c, float d, float cornerRounding, String label, PImage img) {
    super(CORNERS, a, b, c, d, img);
    this.cornerRounding = cornerRounding;
    this.label = new RichString(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(float a, float b, float c, float d, float cornerRounding, String label) {
    super(CORNERS, a, b, c, d);
    this.cornerRounding = cornerRounding;
    this.label = new RichString(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(float a, float b, float c, float d, float cornerRounding) {
    super(CORNERS, a, b, c, d);
    this.cornerRounding = cornerRounding;
    this.label = new RichString("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(float a, float b, float c, float d) {
    super(CORNERS, a, b, c, d);
    this.cornerRounding = 5;
    this.label = new RichString("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  public String toString() {
    return this.label.string;
  }

  void draw() {
    if (bounds()) {
      if (mousePressed && mouseButton == LEFT) {
        // 1. This does not receive the lerpColor treatment because it happens in an
        //    instant, and so lerp will not have enough time move toward the active color.
        this.fillColor = this.activeFillColor;
        this.strokeColor = this.activeStrokeColor;
      } else {
        this.fillColor = lerpColor(this.fillColor, this.hoverFillColor, fadeTime);
        this.strokeColor = lerpColor(this.strokeColor, this.hoverStrokeColor, fadeTime);
      }
    } else {
      this.fillColor = lerpColor(this.fillColor, this.inactiveFillColor, fadeTime);
      this.strokeColor = lerpColor(this.strokeColor, this.inactiveStrokeColor, fadeTime);
    }
    super.draw();
    this.label.update();
  }

  boolean bounds() {
    return bounds(mouseX, mouseY);
  }

  boolean bounds(float x, float y) {
    return x > this.tlCorner.x && x < this.brCorner.x
      && y > this.tlCorner.y && y < this.brCorner.y;
  }

  void toggle() {
    this.toggle = !this.toggle;
  }
}