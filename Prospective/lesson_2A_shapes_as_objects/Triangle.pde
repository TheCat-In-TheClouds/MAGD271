static int triangleInstances = 0;

class Triangle extends Shape2D {

  PVector[] vertices = new PVector[3];
  float rotation = 0f;

  Triangle(PVector vertex0, PVector vertex1, PVector vertex2) {
    super();
    this.vertices[0] = vertex0;
    this.vertices[1] = vertex1;
    this.vertices[2] = vertex2;
    this.name = "triangle (" + triangleInstances + ")";
    triangleInstances++;
  }

  Triangle(PVector[] vertices) {
    super();
    this.vertices = vertices;
    this.name = "triangle (" + triangleInstances + ")";
    triangleInstances++;
  }

  Triangle(PVector vertex0, PVector vertex1, PVector vertex2, Renderer2D renderer) {
    super(renderer);
    this.vertices[0] = vertex0;
    this.vertices[1] = vertex1;
    this.vertices[2] = vertex2;
    this.name = "triangle (" + triangleInstances + ")";
    triangleInstances++;
  }

  Triangle(PVector[] vertices, Renderer2D renderer) {
    super(renderer);
    this.vertices = vertices;
    this.name = "triangle (" + triangleInstances + ")";
    triangleInstances++;
  }

  public void update() {
    update(this.vertices);
  }

  public void update(PVector[] vertices) {
    pushStyle();
    strokeWeight(this.renderer.stroke.weight);
    strokeJoin(this.renderer.stroke.join);
    strokeCap(this.renderer.stroke.cap);
    stroke(this.renderer.stroke.strokeColor);
    if (this.renderer.noFill) {
      noFill();
    } else {
      fill(this.renderer.fillColor);
    }
    triangle(vertices[0].x, vertices[0].y, vertices[1].x, vertices[1].y, vertices[2].x, vertices[2].y);
    popStyle();
  }

  public String toString() {
    return "TRIANGLE [\r\nname: " + this.name
      + ",\r\nrenderer: " + this.renderer.toString()
      + " ]\r\n";
  }

  public PVector centroid() {
    return new PVector(
      (triangle.vertices[0].x + triangle.vertices[1].x + triangle.vertices[2].x) / 3f, 
      (triangle.vertices[0].y + triangle.vertices[1].y + triangle.vertices[2].y) / 3f);
  }

  void translate(PVector translation) {
    for(int i = 0; i < 3; ++i) {
      this.vertices[i].add(translation);
    }
  }

  void translate(float x, float y) {
    for(int i = 0; i < 3; ++i) {
      this.vertices[i].add(x, y);
    }
  }
}