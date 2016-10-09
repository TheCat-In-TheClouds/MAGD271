class TextInput extends ButtonRect {
  char[] entry = {};
  String value = "";
  int entryLimit = 20;
  RichText display;
  boolean hasFocus = false;
  Event submit;

  TextInput(float a, float b, float c, float d, float cornerRounding, String label) {
    super(a, b, c, d, cornerRounding, label);
    this.label.hAlign = RIGHT;
    this.label.pos.x = this.tlCorner.x - 5;
    this.activeFillColor = color(255);
    this.hoverFillColor = color(245);
    this.inactiveFillColor = color(235);
    this.fillColor = this.inactiveFillColor;
    this.activeStrokeColor = color(0);
    this.hoverStrokeColor = color(10);
    this.inactiveStrokeColor = color(20);
    this.strokeColor = this.inactiveStrokeColor;
    this.display = new RichText("", this.center.x + 10, this.center.y, "Source Code Pro", 12);
    this.display.hAlign = LEFT;
    this.display.textShadow = false;
    this.display.fontColor = color(0);
  }

  void draw() {
    super.draw();
    this.display.string = new String(this.entry);
    this.display.draw();
  }

  boolean keyPressed() {
    if (this.hasFocus) {
      if (key == '\n' || key == '\r') {
        if (this.submit != null) { 
          this.submit.call();
        }
        return true;
      } else if (key == '\b' || int(key) == 127) {
        if (entry.length > 0) {
          entry = shorten(entry);
        }
      } else {
        if (entryLimit <= 0 || entry.length < entryLimit) {
          entry = append(entry, key);
        }
      }
    }
    return false;
  }

  @Override
  void onLeftClick() {
    if (this.bounds(mouseX, mouseY)) {
      this.hasFocus = true;
    } else {
      this.hasFocus = false;
    }
  }
}