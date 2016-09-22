import java.util.*;

enum Axis { 
  MAJOR, MINOR
}

class Quilt {

  public int patches, borderThickness;
  public boolean maintainAspect = true, border = false;
  public color borderFillColor;
  public Axis axis;
  private float tileW, tileH;
  private final float minorAxis, majorAxis, minorTileW, minorTileH, majorTileW, majorTileH;
  private List<Patch> basket;

  public Quilt(int p) {
    this.basket = new ArrayList<Patch>();
    this.patches = p;
    this.axis = Axis.MINOR;
    if (this.patches > 0) {
      this.tileW = width / this.patches;
      this.tileH = height / this.patches;
    }
    this.minorAxis = this.minorAxis();
    this.majorAxis = this.majorAxis();
    this.minorTileW = this.minorAxis / this.patches;
    this.minorTileH = this.minorAxis / this.patches;
    this.majorTileW = this.majorAxis / this.patches;
    this.majorTileH = this.majorAxis / this.patches;
  }

  public Quilt(int p, int borderThickness, color borderFillColor) {
    this.basket = new ArrayList<Patch>();
    this.patches = p;
    this.axis = Axis.MINOR;
    if (this.patches > 0) {
      this.tileW = width / this.patches;
      this.tileH = height / this.patches;
    }
    this.minorAxis = this.minorAxis();
    this.majorAxis = this.majorAxis();
    this.minorTileW = this.minorAxis / this.patches;
    this.minorTileH = this.minorAxis / this.patches;
    this.majorTileW = this.majorAxis / this.patches;
    this.majorTileH = this.majorAxis / this.patches;

    this.border = true;
    this.borderThickness = int(constrain(borderThickness, 0, this.minorAxis / 2));
    this.borderFillColor = borderFillColor;
  }

  public void addPatch(Patch p) {
    this.basket.add(p);
  }

  public Patch getPatch(int i) {
    return this.basket.get(i);
  }

  public Patch randomPatch() {
    if (this.basket.size() > 0) {
      return this.basket.get(int(random(0, this.basket.size())));
    } else return null;
  }

  public void draw() {
    maintainAspect();
    if (this.patches > 0) {
      if (this.basket.size() > 0) {
        drawPatches();
        if (border) {
          drawBorder();
        }
      } else {
        noticeToAddPatches();
      }
    } else {
      noticeToIncreasePatchCount();
    }
  }

  public float majorAxis() {
    return max(width, height);
  }

  public float minorAxis() {
    return min(width, height);
  }

  private void maintainAspect() {
    if (this.maintainAspect) {  
      if (this.axis == Axis.MAJOR) {
        this.tileW = this.majorTileW;
        this.tileH = this.majorTileH;
      } else {
        this.tileW = this.minorTileW;
        this.tileH = this.minorTileH;
      }
    }
  }

  private void drawPatches() {
    for (float x = 0; x < width; x+= tileW) {
      for (float y = 0; y < height; y+= tileH) {
        this.randomPatch().draw(x, y, tileW, tileH);
      }
    }
  }

  private void noticeToAddPatches() {
    loadPixels();
    int i = 0;
    for (int x = 0; x < width; ++x) {
      for (int y = 0; y < height; ++y) {
        i = x + y * width;
        pixels[i] = color(
          map(x, 0, height, 255, 127), 
          map(y, 0, width, 0, 255), 
          map(mouseY, 0, width, 255, 0), 
          map(mouseX, 0, height, 127, 255)
          );
      }
    }
    updatePixels();
    textAlign(CENTER, CENTER);
    textSize(width / 18);
    fill(255);
    text("ADD PATCHES TO THE QUILT.", width / 2.0, height / 2.0);
  }

  private void noticeToIncreasePatchCount() {
    loadPixels();
    int i = 0;
    for (int x = 0; x < width; ++x) {
      for (int y = 0; y < height; ++y) {
        i = x + y * width;
        pixels[i] = color(
          map(x, 0, width, 127, 255), 
          map(y, 0, height, 0, 255), 
          map(mouseY, 0, height, 0, 255), 
          map(mouseX, 0, width, 127, 255)
          );
      }
    }
    updatePixels();
    textAlign(CENTER, CENTER);
    textSize(width / 18);
    fill(255);
    text("INCREASE THE PATCH COUNT.", width / 2.0, height / 2.0);
  }

  private void drawBorder() {
    noStroke();
    fill(this.borderFillColor);
    beginShape();
    vertex(0, 0);
    vertex(width, 0);
    vertex(width, height);
    vertex(0, height);
    beginContour();
    vertex(this.borderThickness, height - this.borderThickness);
    vertex(width - this.borderThickness, height - this.borderThickness);
    vertex(width - this.borderThickness, this.borderThickness);
    vertex(this.borderThickness, this.borderThickness);
    endContour();
    endShape(CLOSE);
  }
}