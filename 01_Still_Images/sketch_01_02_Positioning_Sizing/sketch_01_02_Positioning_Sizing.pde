PImage corfu;

void setup() {
  size(420, 420);
  corfu = loadImage("corfu.png");
}

void draw() {
  background(32);

  // 1. The registration point, or pivot, from which the image is drawn is
  //    the top-left corner by default.
  image(corfu, 0, 0, 210, 210);
  image(corfu, 210, 210, 210, 210);
  // 2. Uncomment these image() function calls one by one to see how where
  //    new images appear in the sketch. There is a shortcut to comment/uncomment
  //    see the Edit menu; the shortcut will differ between PC and Mac.
  // image(corfu, 105, 210, 105, 42);
  // image(corfu, 210, 105, 42, 105);
  // image(corfu, 210, 0, 210, 105);
  // image(corfu, 0, 210, 105, 210);
  // image(corfu, 252, 105, 168, 105);
  // image(corfu, 105, 252, 105, 168);

  // 3. The default pivot can be changed using imageMode(), but without using
  //    that syntax, to center one image relative to another, the math would be
  //    centerImgX = referenceImageX + (referenceImageW / 2.0) - (centerImgW / 2.0)
  //    63         = 0               +  (210 / 2.0)            - (84 / 2.0)
  //    63         =                     105                   -  42
  //    centerImgY = referenceImageY + (referenceImageH / 2.0) - (centerImgH / 2.0)
  //    84         = 0               +  (210 / 2.0)            - (42 / 2.0)
  //    84         =                     105                   -  21
  image(corfu, 63, 84, 84, 42);

  //    centerImgX = referenceImageX + (referenceImageW / 2.0) - (centerImgW / 2.0)
  //    294        = 210             +  (210 / 2.0)            - (42 / 2.0)
  //    294        = 210             +   105                   -  21
  //    centerImgY = referenceImageY + (referenceImageH / 2.0) - (centerImgH / 2.0)
  //    273        = 210             +  (210 / 2.0)            - (84 / 2.0)
  //    273        = 210             +   105                   -  42
  image(corfu, 294, 273, 42, 84);
}