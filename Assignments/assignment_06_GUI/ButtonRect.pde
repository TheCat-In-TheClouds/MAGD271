class ButtonRect extends Rect implements Button {

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

  ButtonRect(PVector a, PVector b, float cornerRounding, String label, PImage img) {
    super(CORNER, a, b, img);
    this.cornerRounding = cornerRounding;
    this.label = new RichText(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(PVector a, PVector b, float cornerRounding, String label) {
    super(CORNER, a, b);
    this.cornerRounding = cornerRounding;
    this.label = new RichText(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(PVector a, PVector b, float cornerRounding) {
    super(CORNER, a, b);
    this.cornerRounding = cornerRounding;
    this.label = new RichText("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(PVector a, PVector b) {
    super(CORNER, a, b);
    this.cornerRounding = 5;
    this.label = new RichText("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(float a, float b, float c, float d, float cornerRounding, String label, PImage img) {
    super(CORNER, a, b, c, d, img);
    this.cornerRounding = cornerRounding;
    this.label = new RichText(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(float a, float b, float c, float d, float cornerRounding, String label) {
    super(CORNER, a, b, c, d);
    this.cornerRounding = cornerRounding;
    this.label = new RichText(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(float a, float b, float c, float d, float cornerRounding) {
    super(CORNER, a, b, c, d);
    this.cornerRounding = cornerRounding;
    this.label = new RichText("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
  }

  ButtonRect(float a, float b, float c, float d) {
    super(CORNER, a, b, c, d);
    this.cornerRounding = 5;
    this.label = new RichText("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveFillColor;
    this.strokeColor = this.inactiveStrokeColor;
    this.strokeWeight = 1.5;
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

  void onLeftClick() {
    if (this.enabled
      && this.leftClickEvent != null
      && this.bounds(mouseX, mouseY)) {
      this.leftClickEvent.call();
    }
  }
}