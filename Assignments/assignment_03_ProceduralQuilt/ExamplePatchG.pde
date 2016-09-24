class ExamplePatchG extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(mouseX, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(y, 0, height, 127, 255));
    rect(x, y, w, h);
    fill(20, random(100, 120), 166);
    triangle(x, y, x + w, y, x + w, y + h);
    fill(random(200, 240), map(mouseX, 0, width, 200, 240), 26);
    triangle(x + w / 4.0, y, x + w, y, x + w, y + h * 3/ 4.0);
    fill(random(180, 217), 4, 4);
    triangle(x + w / 2.0, y, x + w, y, x + w, y + h / 2.0);
    fill(10, 90, random(100, 140));
    triangle(x + w * 3 / 4.0, y, x + w, y, x + w, y + h / 4.0);
    popStyle();
  }
}