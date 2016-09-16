class Rect extends Primitive2D {
  float cornerRounding = 0;
  int strokeJoin = ROUND; // SQUARE, PROJECT, ROUND

  Rect(int mode, PVector a, PVector b) {
    super(mode, a, b);
  }

  Rect(int mode, float a, float b, float c, float d) {
    super(mode, a, b, c, d);
  }

  void update() {
    rectMode(this.mode);

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
      rect(this.center, this.scale, this.cornerRounding);
    } else if (this.mode == CORNER) {
      rect(this.tlCorner, this.scale, this.cornerRounding);
    } else if (this.mode == CORNERS) {
      rect(this.tlCorner, this.brCorner, this.cornerRounding);
    } else if (this.mode == RADIUS) {
      rect(this.center, this.radii, this.cornerRounding);
    }
    popStyle();
  }
}