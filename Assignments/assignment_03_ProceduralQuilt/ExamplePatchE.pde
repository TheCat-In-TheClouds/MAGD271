class ExamplePatchE extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(y, 0, height, 127, 255));
    //fill(255);
    rect(x, y, w, h);
    fill(54);
    beginShape();
    vertex(x, y);
    bezierVertex(x + w / 2.0, y,
        x + w, y + h / 2.0,
        x + w, y + h
      );
    bezierVertex(
        x, y + h,
        x, y,
        x, y
      );
    endShape(CLOSE);
    popStyle();
  }
}