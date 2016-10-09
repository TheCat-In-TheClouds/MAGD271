class DraggableRect extends Rect implements Draggable {

  color activeFillColor = color(255, 204, 0);
  color hoverFillColor = color(255, 127, 0);
  color inactiveFillColor = color(255, 0, 27);
  color activeStrokeColor = color(255);
  color hoverStrokeColor = color(235);
  color inactiveStrokeColor = color(215);
  float fadeTime = 0.05;
  float nearByAdjustTime = 0.05;
  boolean isBeingDragged = false;

  DraggableRect(PVector a, PVector b, float cornerRounding) {
    super(CENTER, a, b);
    this.cornerRounding = cornerRounding;
    this.fillColor = this.inactiveFillColor;
    this.noStroke = true;
  }

  DraggableRect(PVector a, PVector b) {
    super(CENTER, a, b);
    this.fillColor = this.inactiveFillColor;
    this.noStroke = true;
  }

  DraggableRect(float a, float b, float c, float d, float cornerRounding) {
    super(CENTER, a, b, c, d);
    this.cornerRounding = cornerRounding;
    this.fillColor = this.inactiveFillColor;
    this.noStroke = true;
  }

  DraggableRect(float a, float b, float c, float d) {
    super(CENTER, a, b, c, d);
    this.fillColor = this.inactiveFillColor;
    this.noStroke = true;
  }

  void draw() {
    this.draw(mouseX, mouseY);
  }

  void draw(float x, float y) {
    if (this.bounds(x, y)) {
      if (mousePressed && mouseButton == LEFT) {
        this.fillColor = this.activeFillColor;
        this.strokeColor = this.activeStrokeColor;
        if (!IS_DRAGGING) {
          this.isBeingDragged = true;
        }
        if (IS_DRAGGING && this.isBeingDragged) {
          this.update(x, y);
        }
      } else {
        this.fillColor = lerpColor(this.fillColor, this.hoverFillColor, fadeTime);
        this.strokeColor = lerpColor(this.strokeColor, this.hoverStrokeColor, fadeTime);
        this.isBeingDragged = false;
      }
    } else {
      this.fillColor = lerpColor(this.fillColor, this.inactiveFillColor, fadeTime);
      this.strokeColor = lerpColor(this.strokeColor, this.inactiveStrokeColor, fadeTime);
    }
    super.draw();
  }

  void draw(float x, float y, Slider slider) {
    if (this.bounds(x, y)) {
      if (mousePressed && mouseButton == LEFT) {
        this.fillColor = this.activeFillColor;
        this.strokeColor = this.activeStrokeColor;
        if (!IS_DRAGGING) {
          this.isBeingDragged = true;
        }
        if (IS_DRAGGING && this.isBeingDragged) {
          this.update(constrain(x, slider.lowerBound, slider.upperBound), this.center.y);
        }
      } else {
        this.fillColor = lerpColor(this.fillColor, this.hoverFillColor, fadeTime);
        this.strokeColor = lerpColor(this.strokeColor, this.hoverStrokeColor, fadeTime);
        this.isBeingDragged = false;
      }
    } /* else if(mousePressed && mouseButton == LEFT && slider.track.bounds(x, y) && x < slider.handle.center.x - slider.handle.scale.x / 2.0) {
      this.center = PVector.lerp(this.center, new PVector(mouseX, this.center.y), this.nearByAdjustTime);
    } else if(mousePressed && mouseButton == LEFT && slider.track.bounds(x, y) && x > slider.handle.center.x + slider.handle.scale.x / 2.0){
      this.center = PVector.lerp(this.center, new PVector(mouseX, this.center.y), this.nearByAdjustTime);
    } */ else {
      this.fillColor = lerpColor(this.fillColor, this.inactiveFillColor, fadeTime);
      this.strokeColor = lerpColor(this.strokeColor, this.inactiveStrokeColor, fadeTime);
    }
    super.draw();
  }
}