Ellipse[] e = new Ellipse[5];
Rect[] r = new Rect[5];

void setup() {
  size(420, 420);
  background(32);
  colorMode(HSB, 360, 100, 100, 100);

  for (int i = 0; i < 5; ++i) {
    e[i] = new Ellipse(CENTER, width*2/3, height*2/3, 100, 140);
    r[i] = new Rect(CENTER, width/3, height/3, 90, 180);
    e[i].shearX = 0.15 * i;
    r[i].shearY = -0.15 * i;
    e[i].noStroke = true;
    r[i].noStroke = true;
    e[i].pivot = new PVector(width*3/4, height*3/4);
    e[i].fillColor = color(map(i, 0, 4, 180, 360), random(80, 100), 
      random(80, 100), random(40, 80));
    r[i].fillColor = color(map(i, 4, 0, 0, 180), random(80, 100), 
      random(80, 100), random(40, 80));
  }
}

void draw() {
  background(32);
  for (int i = 0; i < 5; ++i) {
    e[i].update();
    r[i].update();
    e[i].rotation -= i+0.8;
    r[i].rotation += i+0.8;
  }
}

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