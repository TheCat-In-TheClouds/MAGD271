class ExamplePatchI extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseX, 0, height, 127, 255));
    rect(x, y, w, h);
    fill(20, 110, 166);
    triangle(x, y + h, x + w, y + h, x + w, y);
    fill(223, 221, 26);
    triangle(x + w / 4.0, y + h, x + w, y + h, x + w, y + h / 4.0);  
    fill(217, 4, 4);
    triangle(x + w / 2.0, y + h, x + w, y + h, x + w, y + h / 2.0);  
    fill(10, 90, 140);
    triangle(x + w * 3 / 4.0, y + h, x + w, y + h, x + w, y + h * 3 / 4.0);
    popStyle();
  }
}