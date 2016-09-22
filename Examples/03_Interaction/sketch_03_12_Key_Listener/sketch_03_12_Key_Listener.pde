// 1. A char is a single letter. An array is a series
//    of elements of the same data type stored next to
//    each other in memory. An array is declared by adding
//    square brackets, [], after the data-type. An array
//    can be initialized using curly braces if needed, for
//    example: char[] entry = {'A', 'B', 'C'}; .
char[] entry = {};

// 2. A boolean will detect whether or not the user has
//    completed entering their name. Ideally, however, this
//    would couple with a State Machine.
boolean entryCompleted = false;

// 3. A String will hold the entry array once it is submitted
//    by the user.
String name = "";

void setup() {
  size(420, 420);
  background(64);
  textSize(14);
}

void draw() {
  background(32);
  if (!entryCompleted) {
    fill(255);
    text("What is your name?", 10, height / 2.0);
    fill(127, 204, 255);
    stroke(127, 204, 255);
    line(10, height / 2.0 + 24, 150, height / 2.0 + 24);
    text(new String(entry), 10, height / 2.0 + 20);
  } else {
    fill(255, 255, 0);
    text("Your name: " + name, 10, height / 2.0);
  }
}

void keyTyped() {
  if (!entryCompleted) {
    // 4. If the enter key is pressed, then the entry will
    //    be converted to a String and the entryCompleted
    //    boolean will be switched.
    if (key == '\n' || key == '\r') {
      name = new String(entry);
      entryCompleted = true;
      // 5. If the backspace or delete key (represented here
      //    numerically) is pressed, and entry is not an
      //    empty array, then the array will be shortened.
    } else if (key == '\b' || int(key) == 127) {
      if (entry.length > 0) {
        // 6. Removes the last element from the array.
        entry = shorten(entry);
      }
    } else {
      // 7. Adds the requested element to the end of the array.
      entry = append(entry, key);
    }
  }
}