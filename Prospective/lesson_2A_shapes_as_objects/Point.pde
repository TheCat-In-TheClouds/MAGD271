static int pointInstances = 0;

class Point extends PObject {
  PVector position = new PVector(width/2, height/2, 0);
  Stroke stroke;

  Point() {
    this.position = new PVector(width/2, height/2, 0);
    this.stroke = new Stroke();
    this.name = "point (" + pointInstances + ")";
    pointInstances++;
  }

  Point(PVector position) {
    this.position = position;
    this.stroke = new Stroke();
    this.name = "point (" + pointInstances + ")";
    pointInstances++;
  }

  Point(PVector position, Stroke stroke) {
    this.position = position;
    this.stroke = stroke;
    this.name = "point (" + pointInstances + ")";
    pointInstances++;
  }

  public String toString() {
    return "POINT [\r\nname: " + this.name
      + ",\r\nposition: " + this.position
      + ",\r\nstroke: " + this.stroke.toString()
      + " ]\r\n";
  }

  void update() {
    update(this.position.x, this.position.y);
  }

  void update(float x, float y) {
    pushStyle();
    strokeWeight(this.stroke.weight);
    stroke(this.stroke.strokeColor);
    point(x, y);
    popStyle();
  }

  void translate(PVector translation) {
    this.position.add(translation);
  }

  void translate(float x, float y) {
    this.position.add(x, y);
  }
}