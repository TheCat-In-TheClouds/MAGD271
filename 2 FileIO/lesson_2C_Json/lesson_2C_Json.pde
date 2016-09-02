// Reference: http://developer.wordnik.com/docs.html
// Reference: https://vimeo.com/144831836
String basePath = "http://api.wordnik.com:80/v4/word.json/";
// If this API key does not work, go to the URL above and copy a new one
// from the try it yourself section.
String apiKey = "a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5";

char[] query = {};
boolean querySubmitted;
JSONArray definitions;
String[] response = {};

PFont font;

void setup() {
  size(640, 420);
  background(32);
  font = loadFont("HarlowSolid-48.vlw");
  textFont(font, 20);
}

void draw() {
  background(32);
  if (!querySubmitted) {
    enterQuery();
  } else {
    displayResult();
  }
}

void keyTyped() {
  keyListener();
}

void enterQuery() {
  fill(255);
  text("Please enter a word:", 10, height/2);
  fill(0, 127, 255);
  stroke(127, 204, 255);
  line(10, height / 2.0 + 24, 150, height / 2.0 + 24);
  text(new String(query) + "|", 10, height / 2.0 + 20);
}

void submitQuery(char[] query) {
  String queryToString = new String(query);
  
  // When dealing with user input and retrieving file input, especially
  // from online sources, it is useful to use try-catch-finally blocks
  // so that your program can carry on in the event that a user enters
  // an invalid query or that the API isn't available.
  // try {} is the block where you place code which could throw an Exception.
  // catch() catches the Exception, you can have multiple catch blocks
  // to catch different kinds of Exceptions.
  // finally { } executes a line of code no matter what happens.
  try { 
    definitions = loadJSONArray(basePath 
      + queryToString 
      + "/" + Categories.definitions 
      + "?api_key=" + apiKey);
    printArray(definitions);
    int size = definitions.size();
    // The JSONArray is itself composed of JSONObjects, which have Key-Value
    // Pairs, similar to that of a map or dictionary.
    response = new String[size];
    for(int i = 0; i < size; ++i) {
      response[i] = definitions.getJSONObject(i).getString("text");
    }
  } catch(Exception e) {
    println(e);
    response = new String[] {"Could not find an entry corresponding to the query " + queryToString + "." };
  }
}

void displayResult() {
  int size = response.length;
  fill(255, 255, 0, 127);
  for(int i = 0; i < size; ++i) {
    text(response[i], 10, 20 * (i+1));
  }
  noStroke();
  fill(0);
  rect(0, height-30, width, 30);
  fill(255);
  text("Press Enter to search for a new word.", 10, height - 10);
}

void keyListener() {
  if (!querySubmitted) {
    if (key == '\n' || key == '\r') {
      submitQuery(query);
      querySubmitted = true;
    } else if (key == '\b' || int(key) == 127) {
      if (query.length > 0) {
        query = shorten(query);
      }
    } else {
      query = append(query, key);
    }
  } else {
    if (key == '\n' || key == '\r') {
      query = new char[0];
      querySubmitted = false;
    }
  }
}