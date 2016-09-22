class ExamplePatchB extends Patch {
  
  void draw(float x, float y, float w, float h) {
    noStroke();
    fill(map(x, 0, width, 204, 54), 25, 25);
    rect(x, y, w, h);
    strokeWeight(1.5);
    stroke(255);
    fill(map(y, 0, height, 100, 255), 0, 54, random(54, 204));
    ellipse(x + w / 2.0, y + h / 2.0, w-10, h-10);
    strokeWeight(1);
    fill(map(y, 0, height, 90, 245), 0, 54, random(54, 204));
    arc(x + w / 2.0, y + h / 2.0, w-30, h-30, 0, random(0, TAU), PIE);
  }
}