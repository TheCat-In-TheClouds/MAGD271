class Button extends Rect {

  RichString label;
  color activeColor = color(255, 255, 127);
  color hoverColor = color(0, 255, 127);
  color inactiveColor = color(0, 127, 255);
  boolean toggle = false;

  Button(PVector a, PVector b, float cornerRounding, String label) {
    super(CORNERS, a, b);
    this.cornerRounding = cornerRounding;
    this.label = new RichString(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveColor;
    this.strokeColor = this.label.fontColor;
  }

  Button(PVector a, PVector b, float cornerRounding) {
    super(CORNERS, a, b);
    this.cornerRounding = cornerRounding;
    this.label = new RichString("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveColor;
    this.strokeColor = this.label.fontColor;
  }

  Button(PVector a, PVector b) {
    super(CORNERS, a, b);
    this.cornerRounding = 5;
    this.label = new RichString("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveColor;
    this.strokeColor = this.label.fontColor;
  }

  Button(float a, float b, float c, float d, float cornerRounding, String label) {
    super(CORNERS, a, b, c, d);
    this.cornerRounding = cornerRounding;
    this.label = new RichString(label, this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveColor;
    this.strokeColor = this.label.fontColor;
  }

  Button(float a, float b, float c, float d, float cornerRounding) {
    super(CORNERS, a, b, c, d);
    this.cornerRounding = cornerRounding;
    this.label = new RichString("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveColor;
    this.strokeColor = this.label.fontColor;
  }

  Button(float a, float b, float c, float d) {
    super(CORNERS, a, b, c, d);
    this.cornerRounding = 5;
    this.label = new RichString("Button", this.center, "Verdana Bold", 14);
    this.fillColor = this.inactiveColor;
    this.strokeColor = this.label.fontColor;
  }

  public String toString() {
    return this.label.string;
  }

  void update() {
    if (bounds()) {
      if (mousePressed && mouseButton == LEFT) {
        this.fillColor = this.activeColor;
        // onMouseHeld();
      } else {
        this.fillColor = this.hoverColor;
      }
    } else {
      this.fillColor = this.inactiveColor;
    }
    super.update();
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

  /* void onMouseHeld() {
   println("Mouse held.");
   }
   
   void onMousePressed() {
   println("Mouse pressed.");
   }
   
   void onMouseReleased() {
   println("Mouse released.");
   } */
}