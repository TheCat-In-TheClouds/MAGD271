static int shape2DInstances = 0;

abstract class Shape2D extends PObject {
  Renderer2D renderer = new Renderer2D();

  Shape2D() {
    // this.transform = new Transform2D();
    this.renderer = new Renderer2D();
    this.name = "shape2D (" + shape2DInstances + ")";
    shape2DInstances++;
  }

  Shape2D(Renderer2D renderer) {
    // this.transform = new Transform2D();
    this.renderer = renderer;
    this.name = "shape2D (" + shape2DInstances + ")";
    shape2DInstances++;
  }

  abstract public String toString();
  abstract void update();
}

String pivotToString(int pivot) {
  if (pivot == CENTER) {
    return "center";
  } else if (pivot == RADIUS) {
    return "radius";
  } else if (pivot == CORNER) {
    return "corner";
  } else if (pivot == CORNERS) {
    return "corners";
  }
  return "";
}