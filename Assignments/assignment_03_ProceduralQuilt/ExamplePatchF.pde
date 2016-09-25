class ExamplePatchF extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseX - pmouseX, 0, height, 127, 255));
    rect(x, y, w, h);
    popStyle();

    pushStyle();
    noFill();
    strokeCap(SQUARE);
    strokeWeight(w * 0.375);
    stroke(20, random(100, 120), 166);
    arc(x + w, y, w, h, HALF_PI, PI);
    stroke(random(200, 240), 221, 26);
    arc(x + w, y, w * 3 / 4, h * 3 /4, HALF_PI, PI);
    stroke(random(180, 217), 4, 4);
    arc(x + w, y, w / 2, h / 2, HALF_PI, PI);
    stroke(10, map(mouseY, 0, height, 45, 90), random(100, 140));
    arc(x + w, y, w / 4, h / 4, HALF_PI, PI);
    
    stroke(20, random(100, 120), 166);
    arc(x, y + h, w, h, PI + HALF_PI, TAU);
    stroke(random(200, 240), 221, 26);
    arc(x, y + h, w * 3 / 4, h * 3 /4, PI + HALF_PI, TAU);
    stroke(random(180, 217), 4, 4);
    arc(x, y + h, w / 2, h / 2, PI + HALF_PI, TAU);
    stroke(10, map(mouseX, 0, height, 45, 90), random(100, 140));
    arc(x, y + h, w / 4, h / 4, PI + HALF_PI, TAU);

    popStyle();
  }
}