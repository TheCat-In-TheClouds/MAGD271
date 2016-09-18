void bezier(PVector anchor1, PVector control1, 
  PVector control2, PVector anchor2) {
  bezier(anchor1.x, anchor1.y, 
    control1.x, control1.y, 
    control2.x, control2.y, 
    anchor2.x, anchor2.y);
}

void curve(PVector control1, PVector v1, 
  PVector v2, PVector control2) {
  curve(control1.x, control1.y, 
    v1.x, v1.y, 
    v2.x, v2.y, 
    control2.x, control2.y);
}

void ellipse(PVector v1, PVector v2) {
  ellipse(v1.x, v1.y, v2.x, v2.y);
}

void line(PVector origin, PVector destination) {
  line(origin.x, origin.y, destination.x, destination.y);
}

void point(PVector position) {
  point(position.x, position.y);
}

void quad(PVector v1, PVector v2, PVector v3, PVector v4) {
  quad(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y, v4.x, v4.y);
}

void rect(PVector v1, PVector v2) {
  rect(v1.x, v1.y, v2.x, v2.y);
}

void rect(PVector v1, PVector v2, float r) {
  rect(v1.x, v1.y, v2.x, v2.y, r);
}

void triangle(PVector v1, PVector v2, PVector v3) {
  triangle(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y);
}

void text(String message, PVector v) {
  text(message, v.x, v.y);
}

void translate(PVector pivot) {
  translate(pivot.x, pivot.y);
}

void vertex(PVector vertex) {
  vertex(vertex.x, vertex.y);
}