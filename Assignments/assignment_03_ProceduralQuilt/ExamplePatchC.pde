class ExamplePatchC extends Patch {
  
  void draw(float x, float y, float w, float h) {
    noStroke();
    fill(54, map(y, 0, height, 255, 54), random(127, 255));
    rect(x, y, w, h);
    fill(map(x, 0, height, 0, 255), map(y, 0, height, 0, 255), 54, random(0, 204));
    triangle(x, y, x + w, y, x + w / 2.0, y + h); 
  }
}