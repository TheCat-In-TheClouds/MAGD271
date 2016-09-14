int x1 = 100;
int x2 = 300;
int y1 = 200;
int y2 = 250;

float cornerRounding = 5;

// 1. Assuming you want a text label to be at the center of the button,
//    and you've drawn the rectangle with rectMode(CORNERS), then you
//    will need to calculate the center of the rectangle. This is done
//    by adding half the width (the right side - the left side) to the
//    left side. Same for the height.
int centerX = x1 + (x2 - x1) / 2;
int centerY = y1 + (y2 - y1) / 2;

// 2. The PFont object is used to remember font faces. There are two ways
//    to create a font. See below.
PFont fontA;
PFont fontB;

// 3. A string of characters is used to hold the words you want the label
//    to say. Notice that 'S' is capitalized, meaning a String is not a
//    primitive variable but is an object which has various helpful functions
//    you can access, for example, label.length();
String label = "Hello!";

void setup() {
  size(680, 420);
  background(32);
  rectMode(CORNERS);
  noStroke();

  // 4. The horizontal and vertical alignment of the font. Alternatives,
  //    for example, would be textAlign(TOP, LEFT);
  textAlign(CENTER, CENTER);
  
  // 5. Different fonts may be available on different machines. PFont.list()
  //    will fetch an array of those available fonts. There is a special form
  //    of print, called printArray. This will tell you the index of your
  //    preferred font in the list. You don't need to do this if you already
  //    know what you want.
  println("AVAILABLE FONTS");
  printArray(PFont.list());
  
  // 6. Use Tools > Create Font before creating a font this way. That tool
  //    will add a .vlw file to the data folder of your sketch.
  fontA = loadFont("SourceCodePro.vlw");
  
  // 7. After printing the PFont list to the console, I know that the font
  //    I want is 399, so I can request that font from the list using the
  //    [ ] to specify the index... or I could just type it in.
  // fontB = createFont(PFont.list()[400], 16);
  fontB = createFont("Source Code Pro Bold", 16);

  // 8. Once you load your font, to set that as the font to display,
  //    call textFont(yourFontVariable);
  textFont(fontB);
}

void draw() {
  background(32);
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    textSize(16);
    fill(145);
  } else {
    textSize(14);
    fill(120);
  }
  rect(x1, y1, x2, y2, cornerRounding);

  // 9. If you want to add a text shadow, use the text
  //    function twice. Change the fill and offset the
  //    position slightly.
  //    text(stringText, xPosition, yPosition);
  fill(0);
  text(label, centerX - 1, centerY + 1);
  
  fill(255);
  text(label, centerX, centerY);
}