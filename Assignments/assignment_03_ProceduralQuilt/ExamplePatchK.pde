class ExamplePatchK extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseY, 0, height, 127, 255));
    rect(x, y, w, h);
    fill(20, 110, 166);
    ellipse(x + w / 2.0, y + h / 2.0, w, h);
    fill(223, 221, 26);
    ellipse(x + w / 2.0, y + h / 2.0, w * 0.75, h * 0.75);
    fill(217, 4, 4);
    ellipse(x + w / 2.0, y + h / 2.0, w / 2.0, h / 2.0);
    fill(10, 90, 140);
    ellipse(x + w / 2.0, y + h / 2.0, w / 4.0, h / 4.0);
    popStyle();
  }
}