// The dimensions of a chessboard are standardized but ultimately arbitrary.
// Good coding practice dictates that we not use magic numbers in the middle
// of our code, so we create a static final variable, which is Java/Processing's
// version of a constant. The final keyword means that the variable's value cannot
// be changed after initialization. The static keyword means that the variable
// does not belong to an instance of a class. If some variant of chess or
// checkers dictates a different board size, someone who wants to change our
// code only needs to change this variable instead of searching for '8' throughout.
static final int CHESSBOARD_SIZE = 8;

// What if we want to use the chess notation which presents columns
// as letters when we display a tile on the screen? Internally, we
// should represent our tiles using numbers from 0 to 7, 0 to 7. However, we
// need a separate logic to show the audience a to h for columns and 8 to 1
// for rows. Rows can be calculated easily enough with 8 - y; Columns
// could be handled by either an enum or a static final string[].

//enum Columns {
//  a, b, c, d, e, f, g, h
//}
static final String[] CHESS_COLUMNS = { "a", "b", "c", "d", "e", "f", "g", "h" }; 

class Tile {
  int x, y;
  float w, h;
  PVector center;
  float padding = 1;
  float cornerRounding = 5;

  Tile(int x, int y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.center = new PVector((this.x * this.w) + (this.w/2), (this.y * this.h) + (this.h/2));
  }

  void display(boolean showLabel) {
    color squareColor, labelColor;

    if ((this.x % 2 == 1 && this.y % 2 == 1) || (this.x % 2 == 0 && this.y % 2 == 0)) {
      squareColor = 48;
      labelColor = 255;
    } else {
      squareColor = 0;
      labelColor = 255;
    }

    int xPos = (int)(this.x * this.w);
    int yPos = (int)(this.y * this.h); 
    fill(squareColor);
    rect(xPos + this.padding, yPos + this.padding, this.w - this.padding, this.h - this.padding, this.cornerRounding);
    if (showLabel) {
      fill(labelColor);
      text(chessNotation(), xPos + (this.w / 2.0), yPos + (this.h / 2.0));
    }
  }

  public String toString() {
    return "(" + this.x + "," + this.y + ")";
  }

  public String chessNotation() {
    // return Columns.values()[this.x].toString() + (CHESSBOARD_SIZE - this.y);
    return CHESS_COLUMNS[this.x] + (CHESSBOARD_SIZE - this.y);
  }

  float drawLineTo(Tile destination) {
    line(this.center.x, this.center.y, destination.center.x, destination.center.y);
    return this.center.dist(destination.center);
  }
}