// 1. A library imported to permit the usage of lists.
import java.util.*;

// 2. A list is a flexible, or dynamic, collection of
//    objects that can be accessed by index. Because a
//    list could potentially contain and organize any
//    object, you have to specify what kind of object
//    the list will contain between the < > brackets.
List<PVector> vertices;
int size;

void setup() {
  //size(420, 420);
  fullScreen();
  background(32);
  // 3. There are potentially different kinds of lists,
  //    some of which are based on arrays, others of which
  //    are linked nodes.
  vertices = new ArrayList<PVector>();
  frameRate(3);
}

void draw() {
  //background(32);
  fill(255, 32);
  rect(0, 0, width, height);
  noStroke();
  
  // 4. We add a new random point to the list.
  vertices.add(new PVector(random(0, width), random(0, height)));
  
  // 5. If the list is greater than 10 in size, we
  //    take one of the old points out.
  if(vertices.size() > 10) {
    vertices.remove(0);
  }
  
  size = vertices.size();
  fill(random(127, 255), map(frameCount % 200, 0, 100, 0, 255), map(frameCount % 100, 0, 100, 0, 255), 20);
  beginShape();
  for (int i = 0; i < size; ++i) {
    vertex(vertices.get(i).x, vertices.get(i).y);
  }
  endShape(CLOSE);
}