class RichText {
  String string = "";
  PVector pos;
  PFont font;
  int hAlign = CENTER;
  int vAlign = CENTER;
  int size = 20;
  color fontColor = color(255);
  boolean textShadow = true;
  color shadowColor = color(0);

  RichText(String s, float x, float y) {
    this.string = s;
    this.pos = new PVector(x, y);
    this.font = createFont("Source Code Pro", this.size);
  }

  RichText(String s, float x, float y, String fontName) {
    this.string = s;
    this.pos = new PVector(x, y);
    this.font = createFont(fontName, this.size);
  }

  RichText(String s, float x, float y, int size) {
    this.string = s;
    this.pos = new PVector(x, y);
    this.font = createFont("Source Code Pro", size);
  }

  RichText(String s, float x, float y, String fontName, int size) {
    this.string = s;
    this.pos = new PVector(x, y);
    this.size = size;
    this.font = createFont(fontName, this.size);
  }

  RichText(String s, PVector pos) {
    this.string = s;
    this.pos = pos;
    this.font = createFont("Source Code Pro", this.size);
  }

  RichText(String s, PVector pos, String fontName) {
    this.string = s;
    this.pos = pos;
    this.font = createFont(fontName, this.size);
  }

  RichText(String s, PVector pos, int size) {
    this.string = s;
    this.pos = pos;
    this.size = size;
    this.font = createFont("Source Code Pro", this.size);
  }

  RichText(String s, PVector pos, String fontName, int size) {
    this.string = s;
    this.pos = pos;
    this.size = size;
    this.font = createFont(fontName, this.size);
  }

  public String toString() {
    return this.string;
  }

  void draw() {
    this.draw(this.pos.x, this.pos.y);
  }

  void draw(float x, float y) {
    pushStyle();
    textSize(this.size);
    textFont(this.font);
    textAlign(this.hAlign, this.vAlign);
    if (textShadow) { 
      fill(this.shadowColor);
      text(this.string, x - 1, y + 1);
    }
    fill(this.fontColor);
    text(this.string, x, y);
    popStyle();
  }
}