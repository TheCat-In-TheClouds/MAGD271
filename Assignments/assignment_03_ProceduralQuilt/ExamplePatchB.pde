class ExamplePatchB extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseY - pmouseY, 0, height, 127, 255));
    rect(x, y, w, h);
    ellipseMode(RADIUS);
    fill(20, random(100, 120), 166);
    arc(x, y, w, h, 0, HALF_PI);
    fill(random(200, 240), 221, 26);
    arc(x, y, w * 3 / 4, h * 3 /4, 0, HALF_PI);
    fill(random(180, 217), 4, 4);
    arc(x, y, w / 2, h / 2, 0, HALF_PI);
    fill(10, map(x, 0, height, 45, 90), random(100, 140));
    arc(x, y, w / 4, h / 4, 0, HALF_PI);
    popStyle();
  }
}