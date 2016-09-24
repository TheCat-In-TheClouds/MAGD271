class ExamplePatchK extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseY, 0, height, 127, 255));
    rect(x, y, w, h);
    fill(20, random(100, 120), 166);
    ellipse(x + w / 2.0, y + h / 2.0, w, h);
    fill(random(200, 240), 221, 26);
    ellipse(x + w / 2.0, y + h / 2.0, w * 0.75, h * 0.75);
    fill(random(180, 217), 4, 4);
    ellipse(x + w / 2.0, y + h / 2.0, w / 2.0, h / 2.0);
    fill(10, 90, random(100, 140));
    ellipse(x + w / 2.0, y + h / 2.0, w / 4.0, h / 4.0);
    popStyle();
  }
}