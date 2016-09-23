class ExamplePatchH extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(mouseY, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(y, 0, height, 127, 255));
    rect(x, y, w, h);
    fill(20, 110, 166);
    triangle(x, y, x + w, y, x, y + h);
    fill(223, 221, 26);
    triangle(x, y, x + w * 3 / 4.0, y, x, y + h * 3 / 4.0);
    fill(217, 4, 4);
    triangle(x, y, x + w / 2.0, y, x, y + h / 2.0);
    fill(10, 90, 140);
    triangle(x, y, x + w / 4.0, y, x, y + h / 4.0);
    popStyle();
  }
}