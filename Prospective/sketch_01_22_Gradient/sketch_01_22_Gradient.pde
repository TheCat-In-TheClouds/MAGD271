PGraphics pg, pg2;
int w = 100;
int h = 100;
int i = 0;
int w2 = 300;
int h2 = 450;

void setup() {
  size(420, 420);
  createBlock1();
  createBlock2();
}

void draw() {
  background(32); 
  image(pg2, 0, 0);
  image(pg, 70, 70);
  
}

void createBlock1() {
  pg = createGraphics(w, h);
  pg.beginDraw();
  pg.loadPixels();
  for (int x = 0; x < w; ++x) {
    for (int y = 0; y < h; ++y) {
      i = x + y * w;
      pg.pixels[i] = color(
        map(x, 0, w, 127, 255), 
        map(y, 0, h, 0, 255), 
        map(i, 0, w * h, 0, 255), 
        map(i, 0, w * h, 127, 255)
        );
    }
  }
  pg.updatePixels();
  pg.endDraw();
}

void createBlock2() {
  pg2 = createGraphics(w2, h2);
  pg2.beginDraw();
  pg2.loadPixels();
  for (int x = 0; x < w2; ++x) {
    for (int y = 0; y < h2; ++y) {
      i = x + y * w2;
      pg2.pixels[i] = color(
        map(i, 0, w2 * h2, 0, 75), 
        map(y, 0, w2, 45, 204), 
        map(x, 0, h2, 127, 255), 
        map(i, 0, w2 * h2, 127, 255)
        );
    }
  }
  pg2.updatePixels();
  pg2.endDraw();
}