class ExamplePatchL extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseY, 0, height, 127, 255));
    rect(x, y, w, h);
    fill(20, random(100, 120), 166);
    quad(x + w, y + h / 2.0, x + w / 2.0, y + h, x, y + h / 2.0, x + w / 2.0, y);
    fill(random(200, 240), 221, 26);
    quad(x + (w * 0.875), y + h / 2.0, x + w / 2.0, y + h * 0.875, x + w * 0.125, y + h / 2.0, x + w / 2.0, y + h * 0.125);
    fill(random(180, 217), 4, 4);
    quad(x + (w * 0.75), y + h / 2.0, x + w / 2.0, y + h * 0.75, x + w * 0.25, y + h / 2.0, x + w / 2.0, y + h * 0.25);
    fill(10, 90, random(100, 140));
    quad(x + (w * 0.625), y + h / 2.0, x + w / 2.0, y + h * 0.625, x + w * 0.375, y + h / 2.0, x + w / 2.0, y + h * 0.375);
    popStyle();
  }
}