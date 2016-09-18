class TextInput extends Button {
  char[] entry = {};
  String value = "";
  int entryLimit = 20;
  RichString display;

  TextInput(float a, float b, float c, float d, float cornerRounding, String label) {
    super(a, b, c, d, cornerRounding, label);
    this.label.hAlign = RIGHT;
    this.label.pos.x = this.tlCorner.x - 5;
    this.cornerRounding /= 2.0;
    this.activeFillColor = color(255);
    this.hoverFillColor = color(245);
    this.inactiveFillColor = color(235);
    this.fillColor = this.inactiveFillColor;
    this.activeStrokeColor = color(0);
    this.hoverStrokeColor = color(10);
    this.inactiveStrokeColor = color(20);
    this.strokeColor = this.inactiveStrokeColor;
    this.display = new RichString("", this.center.x + 10, this.center.y, "Source Code Pro", 12);
    this.display.hAlign = LEFT;
    this.display.textShadow = false;
    this.display.fontColor = color(0);
  }

  void update() {
    super.update();
    this.display.string = new String(this.entry);
    this.display.update();
  }

  boolean listen() {
    if (this.toggle) {
      if (key == '\n' || key == '\r') {
        submit();
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

  void submit() {
    this.value = new String(entry);
  }
}