class Ellipse extends Primitive2D {
  Ellipse(int mode, PVector a, PVector b) {
    super(mode, a, b);
  }

  Ellipse(int mode, float a, float b, float c, float d) {
    super(mode, a, b, c, d);
  }

  void draw() {
    ellipseMode(this.mode);

    // 1. pushStyle() and popStyle() enclose style settings
    // that govern stroke and fill.
    pushStyle();
    if (this.noStroke == true || this.strokeWeight == 0) {
      noStroke();
    } else {
      strokeWeight(this.strokeWeight);
      stroke(this.strokeColor);
    }

    if (this.noFill == true) {
      noFill();
    } else {
      fill(this.fillColor);
    }

    if (this.mode == CENTER) {
      ellipse(this.center, this.scale);
    } else if (this.mode == CORNER) {
      ellipse(this.tlCorner, this.scale);
    } else if (this.mode == CORNERS) {
      ellipse(this.tlCorner, this.brCorner);
    } else if (this.mode == RADIUS) {
      ellipse(this.center, this.radii);
    }
    popStyle();
  }
}