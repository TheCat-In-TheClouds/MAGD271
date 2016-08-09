static int ellipseInstances = 0;

class Ellipse extends Shape2D {

  // ellipseMode(CORNERS) and ellipseMode(RADIUS) not supported!
  int pivot = CENTER; // CENTER, RADIUS, CORNER, CORNERS
  Transform2D transform = new Transform2D();

  Ellipse() {
    super();
    this.pivot = CENTER;
    this.name = "ellipse (" + ellipseInstances + ")";
    ellipseInstances++;
  }

  Ellipse(int pivot) {
    super();
    this.pivot = pivot;
    this.name = "ellipse (" + ellipseInstances + ")";
    ellipseInstances++;
  }

  Ellipse(Transform2D transform) {
    super();
    this.pivot = CENTER;
    this.transform = transform;
    this.name = "ellipse (" + ellipseInstances + ")";
    ellipseInstances++;
  }

  Ellipse(Transform2D transform, int pivot) {
    super();
    this.pivot = pivot;
    this.transform = transform;
    this.name = "ellipse (" + ellipseInstances + ")";
    ellipseInstances++;
  }

  Ellipse(Renderer2D renderer) {
    super(renderer);
    this.pivot = CENTER;
    this.name = "ellipse (" + ellipseInstances + ")";
    ellipseInstances++;
  }

  Ellipse(Renderer2D renderer, int pivot) {
    super(renderer);
    this.pivot = pivot;
    this.name = "ellipse (" + ellipseInstances + ")";
    ellipseInstances++;
  }

  Ellipse(Transform2D transform, Renderer2D renderer) {
    super(renderer);
    this.pivot = CENTER;
    this.transform = transform;
    this.name = "ellipse (" + ellipseInstances + ")";
    ellipseInstances++;
  }

  Ellipse(Transform2D transform, Renderer2D renderer, int pivot) {
    super(renderer);
    this.pivot = pivot;
    this.transform = transform;
    this.name = "ellipse (" + ellipseInstances + ")";
    ellipseInstances++;
  }

  public String toString() {
    return "ELLIPSE [\r\nname: " + this.name
      + ",\r\ntransform: " + this.transform.toString()
      + ",\r\nrenderer: " + this.renderer.toString()
      + ",\r\npivot: " + pivotToString(this.pivot)
      + " ]\r\n";
  }

  void update() {
    update(this.transform.position.x, this.transform.position.y, this.transform.scale.x, this.transform.scale.y, this.transform.rotation);
  }

  void update(float x, float y, float w, float h, float rotation) {
    pushStyle();
    ellipseMode(this.pivot);
    strokeWeight(this.renderer.stroke.weight);
    strokeJoin(this.renderer.stroke.join);
    strokeCap(this.renderer.stroke.cap);
    stroke(this.renderer.stroke.strokeColor);
    if (this.renderer.noFill) {
      noFill();
    } else {
      fill(this.renderer.fillColor);
    }
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    ellipse(0, 0, w, h);
    popMatrix();
    popStyle();
  }
}