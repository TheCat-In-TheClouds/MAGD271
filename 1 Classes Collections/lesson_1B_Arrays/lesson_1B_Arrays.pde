// Import needed to access the Java way of sorting, Arrays.sort();
import java.util.*;

// One-Dimensional Arrays
float[] floatPrimitiveArray = new float[7];
String[] stringArray = {"Mno", "Pqr", "Stu", "Abc", "Def", "Ghi", "Jkl", "Vwx", "Yz "};

// Two-Dimensional Arrays
// These are often used to represent a 2D grid with x and y
// coordinates.
Tile[][] chessBoard = new Tile[CHESSBOARD_SIZE][CHESSBOARD_SIZE];

void setup() {
  size(420, 420);
  background(24);
  noStroke();
  smooth();

  println("FLOAT ARRAY SET TO RANDOM VALUES");
  
  int size = floatPrimitiveArray.length;
  for (int i = 0; i < size; ++i) {
    floatPrimitiveArray[i] = random(-20f, 50f);
  }
  println(floatPrimitiveArray);


  println("\r\nAPPENDING FLOAT VALUES TO AN ARRAY");
  floatPrimitiveArray = append(floatPrimitiveArray, 0.005f);
  floatPrimitiveArray = append(floatPrimitiveArray, 0.075f);
  println(floatPrimitiveArray);

  println("\r\nCOMBINING TWO FLOAT ARRAYS");
  float[] coinage = { 0.01f, 0.05f, 0.1f, 0.25f };
  float[] combinedFloatArray = concat(floatPrimitiveArray, coinage);
  println(combinedFloatArray);

  // Notice that this isn't necessary if you need to access the array
  // in reverse order, since you can just change your for loop.
  println("\r\nREVERSING A STRING ARRAY");
  String[] reversed = reverse(stringArray);
  size = reversed.length;
  for (int i = 0; i < size; ++i) {
    print(reversed[i] + " ");
  }
  print("\r\n");
  for (int i = size - 1; i >= 0; --i) {
    print(stringArray[i] + " ");
  }

  println("\r\n\r\nSORTING AN ARRAY\r\nfloat[] sorted with Processing: ");
  floatPrimitiveArray = sort(floatPrimitiveArray);
  println(floatPrimitiveArray);

  print("\r\nString[] sorted with util library: ");
  Arrays.sort(stringArray);
  println(stringArray);

  println("\r\nSHUFFLING AN ARRAY\r\nfloat[] shuffled with primitive shuffle: ");
  shuffle(floatPrimitiveArray);
  println(floatPrimitiveArray);

  print("\r\nString[] shuffled with generic shuffle: ");
  shuffle(stringArray);
  println(stringArray);

  println("\r\n\r\nINITIALIZING A 2D ARRAY OF CUSTOM OBJECTS");
  int majorSize = chessBoard.length;
  for (int y = 0; y < majorSize; ++y) {
    int minorSize = chessBoard[y].length;
    for (int x = 0; x < minorSize; ++x) {
      chessBoard[y][x] = new Tile(x, y, width/(float)minorSize, height/(float)majorSize);
      chessBoard[y][x].display(true);
      print(chessBoard[y][x] + " ");
    }
    print("\r\n");
  }

  // Suppose we want to connect some tiles with lines.
  // Calling the line() function looks really long and ugly.
  strokeWeight(5);
  stroke(255, 0, 0);
  line(chessBoard[3][4].center.x, chessBoard[3][4].center.y, chessBoard[6][5].center.x, chessBoard[6][5].center.y);

  // We can improve the convenience of performing this action by creating traceVector,
  // which accepts PVectors as parameters and secretly converts them to a line.
  strokeWeight(5);
  stroke(0, 255, 0);
  traceVector(chessBoard[1][7].center, chessBoard[2][3].center); 

  // We could also make an object method.
  strokeWeight(5);
  stroke(0, 0, 255);
  println("\r\nDIST BETWEEN TWO TILES: " + chessBoard[5][4].drawLineTo(chessBoard[1][1]));
}

// Processing's shuffle function works on lists, not arrays, so for now
// an opportunity to learn how to shuffle, namely the Fisher-Yates
// shuffle. See http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
// and http://bost.ocks.org/mike/shuffle/ for reference.
// Unlike Processing's array functions for sort, this function shuffles the
// array in place and returns void rather than an array T[].

// Note that we could make void shuffle(float[] array),
// shuffle(int[] array), shuffle(String[] array), but that's a lot
// of unneeded copy and pasting. So instead we can use something
// called Generic types. Generic types create one function which
// can handle a bunch of different types. We need to import
// java.util.*; to give us access to Generic types.
<T> void shuffle(T[] array) {
  int size = array.length;
  T temp;
  int i;

  while (size > 0) {
    i = (int)random(0, size--);
    // These next three steps are a classic 'swap' move,
    // and could be separated out into their own function.
    temp = array[size];
    array[size] = array[i];
    array[i] = temp;
  }
}

// Except that there's a problem: int and float are primitive variables,
// with lowercase 'i' and 'f', while String with a capital 'S' is an
// object. We'll receive an error The function "shuffle()" expects parameters
// like: "shuffle(T[])". There are a few ways around this:
// 1. Instead of using float and int arrays, use Processing's FloatList and
// IntList objects, which have shuffle() functions.
// 2. Use Java's object versions of int and float, so create Integer[]
// or Float[] instead of int[] and float[].
// 3. Create shuffles for primitive arrays as seen below.
void shuffle(int[] array) {
  int size = array.length;
  int temp;
  int i;

  while (size > 0) {
    i = (int)random(0, size--);
    temp = array[size];
    array[size] = array[i];
    array[i] = temp;
  }
}

void shuffle(float[] array) {
  int size = array.length;
  float temp;
  int i;

  while (size > 0) {
    i = (int)random(0, size--);
    temp = array[size];
    array[size] = array[i];
    array[i] = temp;
  }
}

void traceVector(PVector origin, PVector destination) {
  line(origin.x, origin.y, destination.x, destination.y);
}