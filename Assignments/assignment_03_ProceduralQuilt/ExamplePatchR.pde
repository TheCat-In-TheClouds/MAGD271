class ExamplePatchR extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(20, random(100, 120), 166);
    rect(x, y, w, h);
    fill(random(200, 240), 221, 26);
    rect(x + w * 0.25, y, w * 0.75, h * 0.75);
    fill(random(180, 217), 4, 4);
    rect(x + w * 0.5, y, w * 0.5, h * 0.5);
    fill(10, 90, random(100, 140));
    rect(x + w * 0.75, y, w * 0.25, h * 0.25);
    popStyle();
  }
}