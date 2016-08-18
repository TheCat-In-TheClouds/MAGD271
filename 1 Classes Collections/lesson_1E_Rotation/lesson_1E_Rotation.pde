// By default, Processing treats the drawing of an ellipse as a function, but for
// some projects you want to treat the drawing of a shape or group of shapes as a
// stable, persistent object. For that reason, in this example, the ellipse function
// has been wrapped in an Ellipse class. Both ellipses and rectangles easily lend
// themselves to rotation and skewing where other shapes do not, but the four different
// modes of drawing them add a further complication.

Ellipse[] e = new Ellipse[14];

void setup() {
  size(420, 420);
  background(32);
  colorMode(HSB, 360, 100, 100, 100);

  for (int i = 0; i < 14; ++i) {
    e[i] = new Ellipse(CENTER, width/2.0, height/2.0, (14-i)*14.25, (16-i)*14.25);
    e[i].shearX = 2 * i;
    e[i].noStroke = true;
    e[i].pivot = new PVector(width/3.0, height/2.0);
    e[i].fillColor = color(map(i, 0, 14, 0, 360), random(80, 100), 
      random(80, 100), random(20, 50));
  }
}

void draw() {
  background(32);
  for (int i = 0; i < 14; ++i) {
    e[i].update();
    e[i].rotation += i + 0.25;
  }
}

// Processing provides a PVector class to assist with Vector
// math, but many functions still require x and y coordinates
// to be submitted separately as floats. These functions below
// wrap around conventional Processing functions for convenience.
void point(PVector position) {
  point(position.x, position.y);
}

void line(PVector origin, PVector destination) {
  line(origin.x, origin.y, destination.x, destination.y);
}

void ellipse(PVector v1, PVector v2) {
  ellipse(v1.x, v1.y, v2.x, v2.y);
}

void rect(PVector v1, PVector v2) {
  rect(v1.x, v1.y, v2.x, v2.y);
}

void triangle(PVector v1, PVector v2, PVector v3) {
  triangle(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y);
}

void quad(PVector v1, PVector v2, PVector v3, PVector v4) {
  quad(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y, v4.x, v4.y);
}

void bezier(PVector anchor1, PVector control1, PVector control2, PVector anchor2) {
  bezier(anchor1.x, anchor1.y, control1.x, control1.y, control2.x, control2.y, anchor2.x, anchor2.y);
}

void curve(PVector control1, PVector v1, PVector v2, PVector control2) {
  curve(control1.x, control1.y, v1.x, v1.y, v2.x, v2.y, control2.x, control2.y);
}

void vertex(PVector vertex) {
  vertex(vertex.x, vertex.y);
}

void translate(PVector pivot) {
  translate(pivot.x, pivot.y);
}