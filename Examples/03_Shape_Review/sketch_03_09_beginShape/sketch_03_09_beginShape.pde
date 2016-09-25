import java.util.*;

List<PVector> vertices;
int size;

void setup() {
  size(420, 420);
  background(32);
  vertices = new ArrayList<PVector>();
  frameRate(3);
}

void draw() {
  //background(32);
  noStroke();
  vertices.add(new PVector(random(0, width), random(0, height)));
  size = vertices.size();
  fill(map(size, 0, 100, 0, 255), 127, map(size, 0, 100, 0, 255), 20);
  beginShape();
  for (int i = 0; i < size; ++i) {
    vertex(vertices.get(i).x, vertices.get(i).y);
  }
  endShape(CLOSE);
}