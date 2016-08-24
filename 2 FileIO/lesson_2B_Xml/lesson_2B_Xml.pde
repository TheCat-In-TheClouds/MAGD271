// See http://www.nytimes.com/services/xml/rss/index.html
XML nyt;
XML[] nytItems;
String[] headlines;

String[] categories = {
  "Arts", 
  "FashionandStyle", 
  "Sports", 
  "Technology"
};
String selectedCategory;

int displayedHeadline = 0;
int updateRate = 200;
color displayColor = color(255);
// Create a font file for Processing by going to the menu bar > Tools > Create Font.
// This font file will appear as a .vlw in the sketch file if you forget what it's called.
// Declare a PFont object.
PFont times;

void setup() {
  size(1200, 128);
  colorMode(HSB, 100, 100, 100, 100);
  background(5);

  // Choose a random category from an array of possible categories.
  selectedCategory = categories[int(random(0, categories.length))];
  // Retrieve the XML file from the New York Times website.
  nyt = loadXML("http://rss.nytimes.com/services/xml/rss/nyt/" + selectedCategory + ".xml");
  // Retrieve the news items from the XML file as elements of an array.
  nytItems = nyt.getChild("channel").getChildren("item");
  // Extract the headlines from the complex XML objects and store in a String array.
  int size = nytItems.length;
  headlines = new String[size];
  for (int i = 0; i < size; ++i) {
    headlines[i] = nytItems[i].getChild("title").getContent();
    println(headlines[i]);
  }

  // Load the font file into the PFont object with the file name.
  times = loadFont("TimesNewRomanPS-BoldMT-72.vlw");
  // Set the font style to the PFont.
  textFont(times, 48);
}

void draw() {
  background(5);
  fill(displayColor);
  //Display the headline.
  text(headlines[displayedHeadline], 10, height / 2.0 + 24);

  // Every time frameCount is divided cleanly by the updateRate,
  // increment the displayedHeadline and change the color.
  if (frameCount % updateRate == 0) {
    displayedHeadline = (displayedHeadline + 1) % headlines.length;
    displayColor = color(random(100), random(75, 100), random(75, 100));
  }
}