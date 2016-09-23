class ExamplePatchA extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(mouseX - pmouseX, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(y, 0, height, 127, 255));
    rect(x, y, w, h);
    ellipseMode(RADIUS);
    fill(20, 110, 166);
    arc(x + w, y + h, w, h, PI, PI + HALF_PI);
    fill(223, 221, 26);
    arc(x + w, y + h, w * 3 / 4, h * 3 /4, PI, PI + HALF_PI);
    fill(217, 4, 4);
    arc(x + w, y + h, w / 2, h / 2, PI, PI + HALF_PI);
    fill(10, 90, 140);
    arc(x + w, y + h, w / 4, h / 4, PI, PI + HALF_PI);
    popStyle();
  }
}