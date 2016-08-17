static int lineInstances = 0;

class Line extends PObject {
  PVector origin = new PVector(width/2, height/2, 0);
  PVector destination = new PVector(width/6, height/6, 0);
  Stroke stroke = new Stroke();

  Line() {
    this.origin = new PVector(width/2, height/2, 0);
    this.destination = new PVector(width/6, height/6, 0);
    this.stroke = new Stroke();
    this.name = "line (" + lineInstances + ")";
    lineInstances++;
  }

  Line(PVector origin, PVector destination) {
    this.origin = origin;
    this.destination = destination;
    this.stroke = new Stroke();
    this.name = "line (" + lineInstances + ")";
    lineInstances++;
  }

  Line(PVector origin, PVector destination, Stroke stroke) {
    this.origin = origin;
    this.destination = destination;
    this.stroke = stroke;
    this.name = "line (" + lineInstances + ")";
    lineInstances++;
  }

  public String toString() {
    return "LINE [\r\nname: " + this.name
      + ",\r\norigin: " + this.origin
      + ",\r\ndestination: " + this.destination
      + ",\r\nstroke: " + this.stroke.toString()
      + " ]\r\n";
  }

  void update() {
    update(this.origin.x, this.origin.y, this.destination.x, this.destination.y);
  }

  void update(float x1, float y1, float x2, float y2) {
    pushStyle();
    strokeWeight(this.stroke.weight);
    stroke(this.stroke.strokeColor);
    strokeCap(this.stroke.cap);
    line(x1, y1, x2, y2);
    popStyle();
  }

  void translate(PVector translation) {
    this.origin.add(translation);
    this.destination.add(translation);
  }

  void translate(float x, float y) {
    this.origin.add(x, y);
    this.destination.add(x, y);
  }
}