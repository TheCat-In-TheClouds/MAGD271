class Rect extends Primitive2D {
  float cornerRounding = 0;
  int strokeJoin = ROUND; // SQUARE, PROJECT, ROUND
  PImage image;

  Rect(int mode, PVector a, PVector b) {
    super(mode, a, b);
  }

  Rect(PVector a, PVector b) {
    super(CORNER, a, b);
  }

  Rect(int mode, PVector a, PVector b, float r) {
    super(mode, a, b);
    this.cornerRounding = r;
  }

  Rect(PVector a, PVector b, float r) {
    super(CORNER, a, b);
    this.cornerRounding = r;
  }

  Rect(int mode, PVector a, PVector b, PImage img) {
    super(mode, a, b);
    this.image = img;
  }

  Rect( PVector a, PVector b, PImage img) {
    super(CORNER, a, b);
    this.image = img;
  }

  Rect(int mode, float a, float b, float c, float d) {
    super(mode, a, b, c, d);
  }

  Rect(float a, float b, float c, float d) {
    super(CORNER, a, b, c, d);
  }

  Rect(int mode, float a, float b, float c, float d, float r) {
    super(mode, a, b, c, d);
    this.cornerRounding = r;
  }

  Rect(float a, float b, float c, float d, float r) {
    super(CORNER, a, b, c, d);
    this.cornerRounding = r;
  }

  Rect(int mode, float a, float b, float c, float d, PImage img) {
    super(mode, a, b, c, d);
    this.image = img;
  }

  Rect(float a, float b, float c, float d, PImage img) {
    super(CORNER, a, b, c, d);
    this.image = img;
  }

  void draw() {
    if (this.image == null) {
      rectMode(this.mode);
    } else {
      imageMode(this.mode);
    }

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

    if (this.image == null) {
      if (this.mode == CENTER) {
        rect(this.center, this.scale, this.cornerRounding);
      } else if (this.mode == CORNER) {
        rect(this.tlCorner, this.scale, this.cornerRounding);
      } else if (this.mode == CORNERS) {
        rect(this.tlCorner, this.brCorner, this.cornerRounding);
      } else if (this.mode == RADIUS) {
        rect(this.center, this.radii, this.cornerRounding);
      }
    } else {
      if (this.mode == CENTER) {
        image(this.image, this.center, this.scale);
      } else if (this.mode == CORNER) {
        image(this.image, this.tlCorner, this.scale);
      } else if (this.mode == CORNERS) {
        image(this.image, this.tlCorner, this.brCorner);
      } else if (this.mode == RADIUS) {
        image(this.image, this.center, this.radii);
      }
    }
    popStyle();
  }

  boolean bounds() {
    return mouseX > this.tlCorner.x && mouseX < this.brCorner.x
      && mouseY > this.tlCorner.y && mouseY < this.brCorner.y;
  }

  boolean bounds(PVector v) {
    return v.x > this.tlCorner.x && v.x < this.brCorner.x
      && v.y > this.tlCorner.y && v.y < this.brCorner.y;
  }

  boolean bounds(float x, float y) {
    return x > this.tlCorner.x && x < this.brCorner.x
      && y > this.tlCorner.y && y < this.brCorner.y;
  }

  boolean isInside(Rect r) {
    if (r.brCorner.x > this.brCorner.x
      && r.tlCorner.x < this.tlCorner.x
      && r.tlCorner.y < this.tlCorner.y
      && r.brCorner.y > this.brCorner.y) {
      return true;
    }
    return false;
  }
}