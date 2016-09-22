abstract class Primitive2D {
  PVector center;
  PVector scale;
  PVector tlCorner;
  PVector brCorner;
  PVector radii;
  float rotation;
  int mode = CENTER; // CENTER, RADIUS, CORNER, CORNERS
  boolean noFill = false;
  boolean noStroke = false;
  color fillColor = color(255);
  color strokeColor = color(0);
  float strokeWeight = 1;

  protected Primitive2D(int mode, PVector a, PVector b) {
    this.mode = mode;
    if (this.mode == CENTER) {
      this.scale = b;
      this.radii = PVector.div(this.scale, 2.0);
      this.center = a;
      this.tlCorner = PVector.sub(a, this.radii);
      this.brCorner = PVector.add(a, this.radii);
    } else if (this.mode == RADIUS) {
      this.scale = PVector.mult(b, 2);
      this.radii = b;
      this.center = a;
      this.tlCorner = PVector.sub(a, b);
      this.brCorner = PVector.add(a, b);
    } else if (this.mode == CORNER) {
      this.scale = b;
      this.radii = PVector.div(this.scale, 2.0);
      this.center = PVector.add(a, this.radii);
      this.tlCorner = a;
      this.brCorner = PVector.add(a, b);
    } else if (this.mode == CORNERS) {
      this.scale = PVector.sub(b, a);
      this.radii = PVector.div(this.scale, 2.0);
      this.center = PVector.add(a, this.radii);
      this.tlCorner = a;
      this.brCorner = b;
    }
  }

  protected Primitive2D(int mode, float a, float b, float c, float d) {
    this.mode = mode;
    if (this.mode == CENTER) {
      this.scale = new PVector(c, d);
      this.radii = new PVector(c / 2.0, d / 2.0);
      this.center = new PVector(a, b);
      this.tlCorner = new PVector(a - c / 2.0, b - d / 2.0);
      this.brCorner = new PVector(a + c / 2.0, b + d / 2.0);
    } else if (this.mode == RADIUS) {
      this.scale = new PVector(c * 2, d * 2);
      this.radii = new PVector(c, d);
      this.center = new PVector(a, b);
      this.tlCorner = new PVector(a - c, b - d);
      this.brCorner = new PVector(a + c, b + d);
    } else if (this.mode == CORNER) {
      this.scale = new PVector(c, d);
      this.radii = new PVector(c / 2.0, d / 2.0);
      this.center = new PVector(a + c / 2.0, b + d / 2.0);
      this.tlCorner = new PVector(a, b);
      this.brCorner = new PVector(a + c, b + d);
    } else if (this.mode == CORNERS) {
      this.scale = new PVector(c - a, d - b);
      this.radii = new PVector((c - a) / 2.0, (d - b) / 2.0); 
      this.center = new PVector(a + (c - a) / 2.0, b + (d - b) / 2.0);
      this.tlCorner = new PVector(a, b);
      this.brCorner = new PVector(c, d);
    }
  }
  
  public String toString() {
    return toString(this.mode);
  }

  String toString(int displayMode) {
    if (displayMode == CORNER) {
      return "[" + this.tlCorner.x
        + ", " + this.tlCorner.y
        + ", " + this.scale.x
        + ", " + this.scale.y + "]";
    } else if (displayMode == CORNERS) {
      return "[" + this.tlCorner.x
        + ", " + this.tlCorner.y
        + ", " + this.brCorner.x
        + ", " + this.brCorner.y + "]";
    } else if (displayMode == RADIUS) {
      return "[" + this.center.x
        + ", " + this.center.y
        + ", " + this.radii.x
        + ", " + this.radii.y + "]";
    } else {
      return "[" + this.center.x
        + ", " + this.center.y
        + ", " + this.scale.x
        + ", " + this.scale.y + "]";
    }
  }
  
  abstract void draw();
}