class RichString {
  String string = "";
  PVector pos;
  PFont font;
  int hAlign = CENTER;
  int vAlign = CENTER;
  int size = 20;
  color fontColor = color(255);
  boolean textShadow = true;
  color shadowColor = color(0);

  RichString(String s, PVector pos) {
    this.string = s;
    this.pos = pos;
    this.font = createFont("Source Code Pro", this.size);
  }

  RichString(String s, PVector pos, String fontName) {
    this.string = s;
    this.pos = pos;
    this.font = createFont(fontName, this.size);
  }

  RichString(String s, PVector pos, int size) {
    this.string = s;
    this.pos = pos;
    this.size = size;
    this.font = createFont("Source Code Pro", this.size);
  }

  RichString(String s, PVector pos, String fontName, int size) {
    this.string = s;
    this.pos = pos;
    this.size = size;
    this.font = createFont(fontName, this.size);
  }

  void update() {
    pushStyle();
    textSize(this.size);
    textFont(this.font);
    textAlign(this.hAlign, this.vAlign);
    if (textShadow) { 
      fill(this.shadowColor);
      text(this.string, this.pos.x - 1, this.pos.y + 1);
    }
    fill(this.fontColor);
    text(this.string, this.pos);
    popStyle();
  }
}