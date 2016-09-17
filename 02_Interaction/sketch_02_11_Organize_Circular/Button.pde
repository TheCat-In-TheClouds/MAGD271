class Button extends Ellipse {
  RichString label;
  color activeFillColor = color(255, 255, 127);
  color hoverFillColor = color(0, 255, 127);
  color inactiveFillColor = color(0, 127, 255);
  color activeStrokeColor = color(255);
  color hoverStrokeColor = color(235);
  color inactiveStrokeColor = color(215);
  boolean toggle = false;

  Button(PVector center, float radius, String label) {
    super(RADIUS, center, new PVector(radius, radius));
    this.label = new RichString(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 2;
  }

  Button(float cx, float cy, float radius, String label) {
    super(RADIUS, cx, cy, radius, radius);
    this.label = new RichString(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 2;
  }

  public String toString() {
    return this.label.string;
  }

  void update() {
    if (bounds()) {
      if (mousePressed && mouseButton == LEFT) {
        this.fillColor = this.activeFillColor;
        this.strokeColor = this.activeStrokeColor;
      } else {
        this.fillColor = this.hoverFillColor;
        this.strokeColor = this.hoverStrokeColor;
      }
    } else {
      this.fillColor = this.inactiveFillColor;
      this.strokeColor = this.inactiveStrokeColor;
    }
    super.update();
    this.label.update();
  }

  boolean bounds() {
    return bounds(mouseX, mouseY);
  }

  boolean bounds(float x, float y) {
    float d = dist(this.center.x, this.center.y, x, y);
    if (this.noFill && !this.noStroke && this.strokeWeight > 1) {
      return d < this.radii.x + (this.strokeWeight / 2.0) &&
        d > this.radii.x - (this.strokeWeight / 2.0);
    } else {
      return d < this.radii.x;
    }
  }

  void toggle() {
    this.toggle = !this.toggle;
  }
}