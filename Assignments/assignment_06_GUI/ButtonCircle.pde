class ButtonCircle extends Ellipse implements Button {

  color activeFillColor = color(255, 255, 127);
  color hoverFillColor = color(0, 255, 127);
  color inactiveFillColor = color(0, 127, 255);
  color disabledFillColor = color(127);

  color activeStrokeColor = color(255);
  color hoverStrokeColor = color(235);
  color inactiveStrokeColor = color(215);
  color disabledStrokeColor = color(54);

  RichText label;
  float fadeTime = 0.05;
  boolean enabled = true;
  Event leftClickEvent;

  ButtonCircle(PVector center, float radius, String label) {
    super(RADIUS, center, new PVector(radius, radius));
    this.label = new RichText(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonCircle(float cx, float cy, float radius, String label) {
    super(RADIUS, cx, cy, radius, radius);
    this.label = new RichText(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonCircle(float cx, float cy, float radius, String label, boolean ringNoFill) {
    super(RADIUS, cx, cy, radius, radius);
    this.label = new RichText(label, this.center, "Verdana Bold", 14);
    this.noFill = ringNoFill;
    if (this.noFill) {
      this.strokeWeight = 15;
      this.activeStrokeColor = color(255, 54, 54);
      this.hoverStrokeColor = color(255, 127, 255);
      this.inactiveStrokeColor = color(127, 54, 255);
    } else {
      this.strokeWeight = 1.5;
      this.fillColor = this.inactiveFillColor;
    }
    this.strokeColor = this.inactiveStrokeColor;
  }

  public String toString() {
    return this.label.string;
  }

  void draw() {
    if (!this.enabled) {
      this.fillColor = lerpColor(this.fillColor, this.disabledFillColor, fadeTime);
      this.strokeColor = lerpColor(this.strokeColor, this.disabledStrokeColor, fadeTime);
    } else if (!IS_DRAGGING && this.bounds(mouseX, mouseY)) {
      if (mousePressed && mouseButton == LEFT) {
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
    this.label.draw();
  }

  boolean bounds() {
    return bounds(mouseX, mouseY);
  }

  boolean bounds(PVector v) {
    return bounds(v.x, v.y);
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

  void onLeftClick() {
    if (this.enabled
      && this.leftClickEvent != null
      && this.bounds(mouseX, mouseY)) {
      this.leftClickEvent.call();
    }
  }
}