static int rectInstances = 0;

class Rect extends Shape2D {

  // rectMode(CORNERS) and rectMode(RADIUS) not supported!
  int pivot = CENTER; // CENTER, RADIUS, CORNER, CORNERS
  Corners corners = new Corners(0f);
  Transform2D transform = new Transform2D();

  Rect() {
    super();
    this.pivot = CENTER;
    this.corners = new Corners(0f);
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(int pivot) {
    super();
    this.pivot = pivot;
    this.corners = new Corners(0f);
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Corners corners) {
    super();
    this.pivot = CENTER;
    this.corners = corners;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Corners corners, int pivot) {
    super();
    this.pivot = pivot;
    this.corners = corners;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Transform2D transform) {
    super();
    this.pivot = CENTER;
    this.corners = new Corners(0f);
    this.transform = transform;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Transform2D transform, int pivot) {
    super();
    this.pivot = pivot;
    this.corners = new Corners(0f);
    this.transform = transform;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Transform2D transform, Corners corners) {
    super();
    this.pivot = CENTER;
    this.corners = corners;
    this.transform = transform;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Transform2D transform, Corners corners, int pivot) {
    super();
    this.pivot = pivot;
    this.corners = corners;
    this.transform = transform;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Renderer2D renderer) {
    super(renderer);
    this.pivot = CENTER;
    this.corners = new Corners(0f);
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Renderer2D renderer, int pivot) {
    super(renderer);
    this.pivot = pivot;
    this.corners = new Corners(0f);
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Renderer2D renderer, Corners corners) {
    super(renderer);
    this.pivot = CENTER;
    this.corners = corners;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Renderer2D renderer, Corners corners, int pivot) {
    super(renderer);
    this.pivot = pivot;
    this.corners = corners;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Transform2D transform, Renderer2D renderer) {
    super(renderer);
    this.pivot = CENTER;
    this.corners = new Corners(0f);
    this.transform = transform;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Transform2D transform, Renderer2D renderer, int pivot) {
    super(renderer);
    this.pivot = pivot;
    this.corners = new Corners(0f);
    this.transform = transform;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Transform2D transform, Renderer2D renderer, Corners corners) {
    super(renderer);
    this.pivot = CENTER;
    this.corners = corners;
    this.transform = transform;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  Rect(Transform2D transform, Renderer2D renderer, Corners corners, int pivot) {
    super(renderer);
    this.pivot = pivot;
    this.corners = corners;
    this.transform = transform;
    this.name = "rect (" + rectInstances + ")";
    rectInstances++;
  }

  public String toString() {
    return "RECT [\r\nname: " + this.name
      + ",\r\ntransform: " + this.transform.toString()
      + ",\r\nrenderer: " + this.renderer.toString()
      + ",\r\ncorners: " + this.corners.toString()
      + ",\r\npivot: " + pivotToString(this.pivot)
      + " ]\r\n";
  }

  void update() {
    update(this.transform.position.x, this.transform.position.y, this.transform.scale.x, this.transform.scale.y, this.transform.rotation, this.corners);
  }

  void update(float x, float y, float w, float h, float rotation, Corners corners) {
    pushStyle();
    rectMode(this.pivot);
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
    rect(0, 0, w, h, corners.topLeftCorner, corners.topRightCorner, corners.bottomRightCorner, corners.bottomLeftCorner);
    popMatrix();
    popStyle();
  }
}

public class Corners {
  float topLeftCorner = 0;
  float topRightCorner = 0;
  float bottomRightCorner = 0;
  float bottomLeftCorner = 0;

  Corners() {
    this.topLeftCorner = 
      this.topRightCorner = 
      this.bottomRightCorner = 
      this.bottomLeftCorner = 0;
  }

  Corners(float cornerRadii) {
    this.topLeftCorner = 
      this.topRightCorner = 
      this.bottomRightCorner = 
      this.bottomLeftCorner = cornerRadii;
  }

  Corners(float tlCorner, float trCorner, float brCorner, float blCorner) {
    this.topLeftCorner = tlCorner;
    this.topRightCorner = trCorner;
    this.bottomRightCorner = brCorner;
    this.bottomLeftCorner = blCorner;
  }

  public String toString() {
    return "CORNERS [\r\ntopLeftCorner: " + this.topLeftCorner
      + ",\r\ntopRightCorner: " + this.topRightCorner
      + ",\r\nbottomRightCorner: " + this.bottomRightCorner
      + ",\r\nbottomLeftCorner: " + this.bottomLeftCorner
      + " ]";
  }
}