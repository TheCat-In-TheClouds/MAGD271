import java.util.*;

PImage img;
int imgDimensions;
List<Pixel> pix;

void setup() {
  img = loadImage("corfu.png");
  imgDimensions = img.width * img.height;
  pix = new ArrayList<Pixel>();
  println("Dimensions: " + img.width + " " + img.height);

  img.loadPixels();
  for (int i = 0; i < imgDimensions; ++i) {
    pix.add(new Pixel(i % width, (i / width) % height, img.pixels[i]));
  }

  size(200, 200);
  background(32);
}

void draw() {
  pixelSort();
  // image(img, 0, 0);
  noStroke();
  ellipseMode(RADIUS);
  drawManually(10);
}

void pixelSort() {
  if (keyPressed == true) {
    if (key == 'h' || key == 'H') {
      pix.sort(new SortByHue());
    } else if (key == 's' || key == 'S') {
      pix.sort(new SortBySaturation());
    } else if (key == 'b' || key == 'B') {
      pix.sort(new SortByBrightness());
    } else if (key == 'r' || key == 'R') {
      pix.sort(new SortByRed());
    } else if (key == 'g' || key == 'G') {
      pix.sort(new SortByGreen());
    } else if (key == 'b' || key == 'B') {
      pix.sort(new SortByBlue());
    } else if (key == 'q' || key == 'Q') {
      Collections.shuffle(pix);
    } else if (key == 'w' || key == 'W') {
      rotateHue(1);
    } else if (key == 'e' || key == 'E') {
      cycleSaturation(1);
    } else if (key == 't' || key == 'T') {
      cycleBrightness(1);
    } else if (key == 'y' || key == 'Y') {
      cycleRed(1);
    } else if (key == 'u' || key == 'U') {
      cycleGreen(1);
    } else if (key == 'i' || key == 'I') {
      cycleBlue(1);
    } else {
      Collections.sort(pix);
    }
    assignPixels();
  }
}

void assignPixels() {
  for (int i = 0; i < imgDimensions; ++i) {
    img.pixels[i] = pix.get(i).c;
  }
  img.updatePixels();
}

void drawManually(float radius) {
  for (int i = 0; i < imgDimensions; i += radius) {
    fill(pix.get(i).c);
    ellipse(pix.get(i).pos.x, pix.get(i).pos.y, radius, radius);
  }
}

void rotateHue(int increment) {
  pushStyle();
  colorMode(HSB);
  for (int i = 0; i < imgDimensions; ++i) {
    pix.get(i).rotateHue(increment);
  }
  popStyle();
}

void cycleSaturation(int increment) {
  pushStyle();
  colorMode(HSB);
  for (int i = 0; i < imgDimensions; ++i) {
    pix.get(i).cycleSaturation(increment);
  }
  popStyle();
}

void cycleBrightness(int increment) {
  pushStyle();
  colorMode(HSB);
  for (int i = 0; i < imgDimensions; ++i) {
    pix.get(i).cycleBrightness(increment);
  }
  popStyle();
}

void cycleRed(int increment) {
  pushStyle();
  colorMode(RGB);
  for (int i = 0; i < imgDimensions; ++i) {
    pix.get(i).cycleRed(increment);
  }
  popStyle();
}

void cycleGreen(int increment) {
  pushStyle();
  colorMode(RGB);
  for (int i = 0; i < imgDimensions; ++i) {
    pix.get(i).cycleGreen(increment);
  }
  popStyle();
}

void cycleBlue(int increment) {
  pushStyle();
  colorMode(RGB);
  for (int i = 0; i < imgDimensions; ++i) {
    pix.get(i).cycleBlue(increment);
  }
  popStyle();
}