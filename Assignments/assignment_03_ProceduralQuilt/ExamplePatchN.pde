// 9. Each class you create will extend the Pattern
//    class. By doing so, the class you create will
//    have to define a function draw(float x,
//    float y, float w, float h) {}
class ExamplePatchN extends Patch {

  PImage image;

  ExamplePatchN() {
  }

  // 10. If you would prefer to work with PImages
  //     instead of Processing 2D primitives, you
  //     can create a patch like so, which passes
  //     the loaded image into the object when it
  //     is built with the constructor in the main
  //     sketch setup() { }. In this case, img is
  //     assigned to the instance field image, which
  //     is then available to use in draw.
  ExamplePatchN(PImage img) {
    this.image = img;
  }

  void draw(float x, float y, float w, float h) {
    noStroke();
    if (this.image == null) {
      fill(255, map(x, 0, width, 100, 255), 0);
      rect(x, y, w, h);
    } else {
      tint(0, map(x, 0, width, 100, 255), 127);
      image(image, x, y, w, h);
    }
    fill(map(y, 0, width, 100, 255), random(0, 25), 0, 204);
    rect(x, y, w / 2.0, h / 2.0);
  }
}