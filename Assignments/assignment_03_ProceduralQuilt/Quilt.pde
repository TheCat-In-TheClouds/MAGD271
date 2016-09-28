import java.util.*;

enum Axis { 
  MAJOR, MINOR
}

class Quilt {

  public int patches, borderThickness;
  public boolean maintainAspect = true, border = false, mouseResponsive = true;
  public color borderFillColor;
  public Axis axis;
  private float patchW, patchH, quiltW, quiltH;
  private final float minorAxis, majorAxis, minorpatchW, minorpatchH, majorpatchW, majorpatchH, minPatches, maxPatches;
  private List<Patch> basket;

  public Quilt(int p) {
    this.basket = new ArrayList<Patch>();
    this.patches = p;
    this.minPatches = 1;
    this.maxPatches = 48;
    this.axis = Axis.MINOR;
    this.quiltW = width;
    this.quiltH = height;
    if (this.patches > 0) {
      this.patchW = quiltW / this.patches;
      this.patchH = quiltH / this.patches;
    }
    this.minorAxis = this.minorAxis();
    this.majorAxis = this.majorAxis();
    this.minorpatchW = this.minorAxis / this.patches;
    this.minorpatchH = this.minorAxis / this.patches;
    this.majorpatchW = this.majorAxis / this.patches;
    this.majorpatchH = this.majorAxis / this.patches;
  }

  public Quilt(int p, int borderThickness, color borderFillColor) {
    this.basket = new ArrayList<Patch>();
    this.patches = p;
    this.minPatches = 1;
    this.maxPatches = 64;
    this.axis = Axis.MINOR;
    this.quiltW = width;
    this.quiltH = height;
    if (this.patches > 0) {
      this.patchW = quiltW / this.patches;
      this.patchH = quiltH / this.patches;
    }
    this.minorAxis = this.minorAxis();
    this.majorAxis = this.majorAxis();
    this.minorpatchW = this.minorAxis / this.patches;
    this.minorpatchH = this.minorAxis / this.patches;
    this.majorpatchW = this.majorAxis / this.patches;
    this.majorpatchH = this.majorAxis / this.patches;

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
    scaleToMouse();

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
        this.patchW = this.majorpatchW;
        this.patchH = this.majorpatchH;
      } else {
        this.patchW = this.minorpatchW;
        this.patchH = this.minorpatchH;
      }
    }
  }

  private void scaleToMouse() {
    if (this.mouseResponsive) {
      if (this.maintainAspect) {
        if (this.axis == Axis.MAJOR) {
          if (this.majorAxis == width) {
            this.patchW = this.patchH = this.majorAxis / ceil(map(mouseY, 0, height, minPatches, maxPatches));
          } else {
            this.patchW = this.patchH = this.majorAxis / ceil(map(mouseX, 0, width, minPatches, maxPatches));
          }
        } else {
          if (this.minorAxis == width) {
            this.patchW = this.patchH = this.minorAxis / ceil(map(mouseY, 0, height, minPatches, maxPatches));
          } else {
            this.patchW = this.patchH = this.minorAxis / ceil(map(mouseX, 0, width, minPatches, maxPatches));
          }
        }
      } else {
        this.patchW = width / ceil(map(mouseX, 0, width, minPatches, maxPatches));
        this.patchH = height / ceil(map(mouseY, 0, height, minPatches, maxPatches));
      }
    }
  }

  private void drawPatches() {
    for (float x = 0; x < quiltW; x+= patchW) {
      for (float y = 0; y < quiltH; y+= patchH) {
        this.randomPatch().draw(x, y, patchW, patchH);
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