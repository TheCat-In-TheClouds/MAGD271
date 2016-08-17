// Lesson 3 introduced some limitations and problems with arrays.
// For example, if we want to check the min or max of an array, or
// shuffle it, we'll probably have to create our own method.
// Furthermore, while Processing may mask it with some special
// functionality, the array is usually of a static size. Between
// this and always having to access an element of an array through
// its index, arrays can be clumsy. So we need to learn about other
// collections of items to do get work done. The downside is that
// to learn collections properly you should learn Generics. If you identify
// as a programmer, do this. If you identify as an artist, Processing
// has some helpful syntax to simplify the matter.
import java.util.*;

// LISTS
// Unlike arrays, lists are easier to grow in size on the fly
// by adding new elements.

// The Processing way
// Because Processing's lists allow you to append unique values and
// because you can sort them, they have some of the functionality of
// a set. They're also easier to print to the console.
IntList pIntList = new IntList();
FloatList pFloatList = new FloatList();
StringList pStringList = new StringList();

// The Java way (using Generics)
// This gives you more choice as to whether to use an array list
// or a linked list. If you want to go deeper, look up their respective
// advantages and disadvantages.
List<Integer> javaIntList = new ArrayList<Integer>();
List<Float> javaFloatList = new LinkedList<Float>();
List<String> javaStringList = new ArrayList<String>();

// DICTIONARIES (AKA MAPS)
// What if you wanted to look up someone's telephone number
// by their last and first name, or wanted to look up the
// definition of a word? Sometimes very complex clumps of
// information need to be able to picked up and found with
// a simple handle. Dictionaries do this by establishing
// key-value pairs (KVPs)

// The Processing way
IntDict pIntegerDictionary = new IntDict();
FloatDict pFloatDictionary = new FloatDict();
StringDict pStringDictionary = new StringDict();

// The Java way (using Generics)
// Notice that the first data type in the list of generic values <first, second>
// will be your key object, while the second data type will be your value.
// Java is much more flexible in that you can make any data type your key and
// any data type your value, including custom objects you create. Also note,
// you have an option of further exploring what other Maps besides the HashMap
// can be used to act like a Dictionary.
Map<String, Integer> javaStringIntDictionary = new HashMap<String, Integer>();
Map<String, Float> javaStringFloatDictionary = new HashMap<String, Float>();
Map<String, String> javaStringStringDictionary = new HashMap<String, String>();

// There are a whole lot more collections to explore, including
// stacks, queues and trees!

Clicker c;

void setup() {
  println("LISTS");
  println("\r\nProcessing List basic functionality");
  pIntList.append(25);
  pIntList.append(12);
  pIntList.append(17);
  pIntList.append(-6);
  pIntList.appendUnique(12);
  println("After appending values: " + pIntList);
  pIntList.add(1, 3);
  pIntList.sub(2, 4);
  pIntList.mult(3, 2);
  pIntList.div(0, 5);
  println("After performing mathemtical operations: " + pIntList);
  pIntList.sort();
  println("After sorting: " + pIntList);
  pIntList.shuffle();
  println("After shuffling: " + pIntList);
  println("Minimum value: " + pIntList.min());
  println("Maximum value: " + pIntList.max());

  println("\r\nJava ArrayList basic functionality");
  // Java's add() is the same as Processing's append()
  javaIntList.add(5);
  javaIntList.add(0, 3); // Adds 3 to the 0th spot in the array.
  javaIntList.add(8);
  javaIntList.add(-7);
  println("After adding values: " + javaIntList);
  Collections.sort(javaIntList);
  println("After sorting: " + javaIntList);
  Collections.shuffle(javaIntList);
  println("After shuffling: " + javaIntList);

  println("\r\nDICTIONARIES (AKA MAPS)");

  println("\r\nProcessing Dictionary basic functionality");
  pFloatDictionary.set("Mocha", 4.50f);
  pFloatDictionary.set("Smooth Jazz Compilation Album", 13.00f);
  pFloatDictionary.set("Coffee", 2.00f);
  pFloatDictionary.set("Biscotti", 3.25f);
  pFloatDictionary.sortKeys();
  println("The alphabetized menu: " + pFloatDictionary);
  pFloatDictionary.sortValues();
  println("The cheapskate's menu: " + pFloatDictionary);
  println("Is it true the coffee shop sells kombucha? " + pFloatDictionary.hasKey("Kombucha"));
  println("How much does a Mocha cost? " + pFloatDictionary.get("Mocha"));

  println("\r\nJava Dictionary basic functionality");
  javaStringFloatDictionary.put("Kombucha", 5.00f);
  javaStringFloatDictionary.put("Chai", 4.25f);
  javaStringFloatDictionary.put("Iced Tea", 2.00f);
  javaStringFloatDictionary.put("Lemonade", 2.50f);
  println("The menu: " + javaStringFloatDictionary);
  println("How much does Kombucha cost? " + javaStringFloatDictionary.get("Kombucha"));

  c = new Clicker();
  size(500, 500);
  background(127);
  colorMode(HSB, 255);
  noStroke();
  smooth();
}

void draw() {
  background(32);
  c.drawWidgets(pmouseX, pmouseY, 25);
  c.showInstructions();
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    c.addWidget(25);
  } else if (mouseButton == RIGHT) {
    c.removeWidget();
  } else if (mouseButton == CENTER) {
    c.retireWidget();
  }
}