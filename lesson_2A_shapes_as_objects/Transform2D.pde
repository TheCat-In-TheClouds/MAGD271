static final int DEFAULT_RELATIVE_SCALE = 20;

class Transform2D {
  PVector position = new PVector(width/2, height/2);
  PVector scale = new PVector(width/DEFAULT_RELATIVE_SCALE, height/DEFAULT_RELATIVE_SCALE);
  float rotation = 0;

  Transform2D() {
    this.position = new PVector(width/2, height/2, 0);
    this.scale = new PVector(width/DEFAULT_RELATIVE_SCALE, height/DEFAULT_RELATIVE_SCALE);
    this.rotation = 0;
  }

  Transform2D(PVector position) {
    this.position = position;
    this.scale = new PVector(width/DEFAULT_RELATIVE_SCALE, height/DEFAULT_RELATIVE_SCALE);
    this.rotation = 0;
  }

  Transform2D(PVector position, PVector scale) {
    this.position = position;
    this.scale = scale;
    this.rotation = 0;
  }

  Transform2D(PVector position, PVector scale, float rotation) {
    this.position = position;
    this.scale = scale;
    this.rotation = rotation;
  }

  public String toString() {
    return "TRANSFORM2D [\r\nposition: " + this.position
      + ",\r\nscale: " + this.scale
      + ",\r\nrotation: " + this.rotation
      + " ]";
  }

  void translate(PVector translation) {
    this.position.add(translation);
  }

  void translate(float x, float y) {
    this.position.add(x, y);
  }

  void scale(PVector scalar) {
    this.scale.x *= scalar.x;
    this.scale.y *= scalar.y;
  }

  void scale(float xScalar, float yScalar) {
    this.scale.x *= xScalar;
    this.scale.y *= yScalar;
  }

  void scale(float scalar) {
    this.scale.mult(scalar);
  }

  void rotate(float degree) {
    this.rotation = (this.rotation + degree) % 360;
  }
}