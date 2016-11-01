class Slider {
  Rect track;
  DraggableRect handle;
  Range range = new Range();
  RichText valueLabel;
  RichText label;
  boolean showLabel = true, showValueLabel = true;
  float lowerBound, upperBound, trackJump = 20;

  Slider(int mode, PVector a, PVector b) {
    this.track = new Rect(mode, a, b);
    this.track.noStroke = true;
    this.track.fillColor = color(16);
    float minDimension = min(this.track.scale.x, this.track.scale.y);
    this.handle = new DraggableRect(this.track.center.x, this.track.center.y, minDimension  * 2.0, minDimension);
    this.handle.fillColor = this.handle.inactiveFillColor = color(64);
    this.handle.activeFillColor = this.handle.hoverFillColor = color(128);
    this.lowerBound = this.track.tlCorner.x + this.handle.scale.x / 2.0;
    this.upperBound = this.track.brCorner.x - this.handle.scale.x / 2.0;
    this.valueLabel = new RichText(this.range.toString(), this.handle.center.x, this.handle.center.y + this.handle.scale.y, 12);
    this.label = new RichText(this.getClass().getSimpleName(), this.track.tlCorner.x - 3, this.track.center.y, 12);
    this.label.hAlign = RIGHT;
  }

  Slider(PVector a, PVector b) {
    this.track = new Rect(CORNER, a, b);
    this.track.noStroke = true;
    this.track.fillColor = color(16);
    float minDimension = min(this.track.scale.x, this.track.scale.y);
    this.handle = new DraggableRect(this.track.center.x, this.track.center.y, minDimension  * 2.0, minDimension);
    this.handle.fillColor = this.handle.inactiveFillColor = color(64);
    this.handle.activeFillColor = this.handle.hoverFillColor = color(128);
    this.lowerBound = this.track.tlCorner.x + this.handle.scale.x / 2.0;
    this.upperBound = this.track.brCorner.x - this.handle.scale.x / 2.0;
    this.valueLabel = new RichText(this.range.toString(), this.handle.center.x, this.handle.center.y + this.handle.scale.y, 12);
    this.label = new RichText(this.getClass().getSimpleName(), this.track.tlCorner.x - 3, this.track.center.y, 12);
    this.label.hAlign = RIGHT;
  }

  Slider(int mode, PVector a, PVector b, float r) {
    this.track = new Rect(mode, a, b, r);
    this.track.noStroke = true;
    this.track.fillColor = color(16);
    float minDimension = min(this.track.scale.x, this.track.scale.y);
    this.handle = new DraggableRect(this.track.center.x, this.track.center.y, minDimension  * 2.0, minDimension, r);
    this.handle.fillColor = this.handle.inactiveFillColor = color(64);
    this.handle.activeFillColor = this.handle.hoverFillColor = color(128);
    this.lowerBound = this.track.tlCorner.x + this.handle.scale.x / 2.0;
    this.upperBound = this.track.brCorner.x - this.handle.scale.x / 2.0;
    this.valueLabel = new RichText(this.range.toString(), this.handle.center.x, this.handle.center.y + this.handle.scale.y, 12);
    this.label = new RichText(this.getClass().getSimpleName(), this.track.tlCorner.x - 3, this.track.center.y, 12);
    this.label.hAlign = RIGHT;
  }

  Slider(PVector a, PVector b, float r) {
    this.track = new Rect(CORNER, a, b, r);
    this.track.noStroke = true;
    this.track.fillColor = color(16);
    float minDimension = min(this.track.scale.x, this.track.scale.y);
    this.handle = new DraggableRect(this.track.center.x, this.track.center.y, minDimension  * 2.0, minDimension, r);
    this.handle.fillColor = this.handle.inactiveFillColor = color(64);
    this.handle.activeFillColor = this.handle.hoverFillColor = color(128);
    this.lowerBound = this.track.tlCorner.x + this.handle.scale.x / 2.0;
    this.upperBound = this.track.brCorner.x - this.handle.scale.x / 2.0;
    this.valueLabel = new RichText(this.range.toString(), this.handle.center.x, this.handle.center.y + this.handle.scale.y, 12);
    this.label = new RichText(this.getClass().getSimpleName(), this.track.tlCorner.x - 3, this.track.center.y, 12);
    this.label.hAlign = RIGHT;
  }

  Slider(int mode, float a, float b, float c, float d) {
    this.track = new Rect(mode, a, b, c, d);
    this.track.noStroke = true;
    this.track.fillColor = color(16);
    float minDimension = min(this.track.scale.x, this.track.scale.y);
    this.handle = new DraggableRect(this.track.center.x, this.track.center.y, minDimension  * 2.0, minDimension);
    this.handle.fillColor = this.handle.inactiveFillColor = color(64);
    this.handle.activeFillColor = this.handle.hoverFillColor = color(128);
    this.lowerBound = this.track.tlCorner.x + this.handle.scale.x / 2.0;
    this.upperBound = this.track.brCorner.x - this.handle.scale.x / 2.0;
    this.valueLabel = new RichText(this.range.toString(), this.handle.center.x, this.handle.center.y + this.handle.scale.y, 12);
    this.label = new RichText(this.getClass().getSimpleName(), this.track.tlCorner.x - 3, this.track.center.y, 12);
    this.label.hAlign = RIGHT;
  }

  Slider(float a, float b, float c, float d) {
    this.track = new Rect(CORNER, a, b, c, d);
    this.track.noStroke = true;
    this.track.fillColor = color(16);
    float minDimension = min(this.track.scale.x, this.track.scale.y);
    this.handle = new DraggableRect(this.track.center.x, this.track.center.y, minDimension  * 2.0, minDimension);
    this.handle.fillColor = this.handle.inactiveFillColor = color(64);
    this.handle.activeFillColor = this.handle.hoverFillColor = color(128);
    this.lowerBound = this.track.tlCorner.x + this.handle.scale.x / 2.0;
    this.upperBound = this.track.brCorner.x - this.handle.scale.x / 2.0;
    this.valueLabel = new RichText(this.range.toString(), this.handle.center.x, this.handle.center.y + this.handle.scale.y, 12);
    this.label = new RichText(this.getClass().getSimpleName(), this.track.tlCorner.x - 3, this.track.center.y, 12);
    this.label.hAlign = RIGHT;
  }

  Slider(int mode, float a, float b, float c, float d, float r) {
    this.track = new Rect(mode, a, b, c, d, r);
    this.track.noStroke = true;
    this.track.fillColor = color(16);
    float minDimension = min(this.track.scale.x, this.track.scale.y);
    this.handle = new DraggableRect(this.track.center.x, this.track.center.y, minDimension  * 2.0, minDimension, r);
    this.handle.fillColor = this.handle.inactiveFillColor = color(64);
    this.handle.activeFillColor = this.handle.hoverFillColor = color(128);
    this.lowerBound = this.track.tlCorner.x + this.handle.scale.x / 2.0;
    this.upperBound = this.track.brCorner.x - this.handle.scale.x / 2.0;
    this.valueLabel = new RichText(this.range.toString(), this.handle.center.x, this.handle.center.y + this.handle.scale.y, 12);
    this.label = new RichText(this.getClass().getSimpleName(), this.track.tlCorner.x - 3, this.track.center.y, 12);
    this.label.hAlign = RIGHT;
  }

  Slider(float a, float b, float c, float d, float r) {
    this.track = new Rect(CORNER, a, b, c, d, r);
    this.track.noStroke = true;
    this.track.fillColor = color(16);
    float minDimension = min(this.track.scale.x, this.track.scale.y);
    this.handle = new DraggableRect(this.track.center.x, this.track.center.y, minDimension  * 2.0, minDimension, r);
    this.handle.fillColor = this.handle.inactiveFillColor = color(64);
    this.handle.activeFillColor = this.handle.hoverFillColor = color(128);
    this.lowerBound = this.track.tlCorner.x + this.handle.scale.x / 2.0;
    this.upperBound = this.track.brCorner.x - this.handle.scale.x / 2.0;
    this.valueLabel = new RichText(this.range.toString(), this.handle.center.x, this.handle.center.y + this.handle.scale.y, 12);
    this.label = new RichText(this.getClass().getSimpleName(), this.track.tlCorner.x - 3, this.track.center.y, 12);
    this.label.hAlign = RIGHT;
  }

  public String toString() {
    return this.label.string;
  }

  void draw() {
    this.track.draw();
    this.handle.draw(mouseX, mouseY, this);
    this.range.value = map(this.handle.center.x, this.lowerBound, this.upperBound, this.range.lowerBound, this.range.upperBound);
    if (this.showValueLabel) {
      this.valueLabel.string = this.range.toString();
      this.valueLabel.draw(this.handle.center.x, this.handle.center.y + this.handle.scale.y);
    }
    if (this.showLabel) {
      this.label.draw();
    }
  }
}