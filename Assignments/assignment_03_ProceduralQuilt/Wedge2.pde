class Wedge2 extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    colorMode(HSB, 360, 100, 100);
    float a = map(y, 0, height, 127, 255);
    float s = map(mouseY, 0, width, 100, 75);
    float hu = map(y, 0, height, 0, 70);
    fill(map(x, 0, height, 0, 255), 255);
    rect(x, y, w, h);
    
    rect(x, y, w, h);
    //fill(hu, s, 50, a);
    fill(54);
    triangle(x, y, x + w, y, x, y + h);
    //fill(hu, s, 62.5, a);
    fill(127);
    triangle(x, y, x + w * 3 / 4.0, y, x, y + h * 3 / 4.0);
    //fill(hu, s, 75, a);
    fill(154);
    triangle(x, y, x + w / 2.0, y, x, y + h / 2.0);
    //fill(hu, s, 100, a);
    fill(204);
    triangle(x, y, x + w / 4.0, y, x, y + h / 4.0);
    popStyle();
  }
}