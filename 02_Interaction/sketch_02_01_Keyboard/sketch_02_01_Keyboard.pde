void setup() {
  size(420, 420);
  background(32);
  // 1. As with a Word Processor, Processing aligns the text
  //    relative to the (x, y) coordinates you provide it based
  //    on this function. The first parameter is for horizontal
  //    alignment, the second is for vertical alignment. So,
  //    potential combinations include (LEFT, TOP) and (RIGHT, BOTTOM).
  textAlign(CENTER, CENTER);
  
  // 2. The size of the text can be set with this function.
  textSize(140);
}

void draw() {
  fill(32, 32);
  rect(0, 0, width, height);

  // 3. Processing is confusing in regards to the difference
  //    between keyPressed and keyPressed(). The former is a
  //    boolean (true or false) used with a conditional.
  if (keyPressed) {
    fill(255);
    
    // 4. The String message to display as text is the first
    //    parameter of this function. The x and y coordinates
    //    are the second and third.
    text(key, width / 2.0, height / 4.0);
  }
}

// 5. The following are event functions. See the sketch for
//    reference as to when they are fired. If you are familiar
//    with Java, and would like to work directly with a KeyEvent
//    object, reference 
//    http://docs.oracle.com/javase/6/docs/api/java/awt/event/KeyEvent.html
// void keyPressed(KeyEvent ke) {
// }
void keyPressed() { // RED
  println(key + " " + int(key) + " " +  keyCode + " pressed.");
  fill(255, 0, 0);
  text(key, width / 4.0, height / 2.0);
}

void keyTyped() { // BLUE
  println(key + " " + int(key) + " " + keyCode + " typed.");
  fill(0, 0, 255);
  text(key, width / 2.0, height * 3/ 4.0);
}

void keyReleased() { // GREEN
  println(key + " " + int(key) + " " +  keyCode + " released.");
  fill(0, 255, 0);
  text(key, width * 3 / 4.0, height / 2.0);
}