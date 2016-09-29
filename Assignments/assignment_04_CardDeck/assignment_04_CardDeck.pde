// If true, the value of an ace card is 11; if false,
// then the value is 1.
public final static boolean ACES_HIGH = true;

// If you want to work on the front and back of just
// one card, and to ensure that it simulates default
// proportions (2.5" x 3.5"), then comment out all of
// the Deck d lines and comment in all of the Card c
// lines.

Card c;
Deck d;

void setup() {
  fullScreen();
  //size(680, 420);
  background(64);

  // There are multiple constructors to help you build
  // the card you want.
  //c = new Card(); // Picks a random card every time.
  //c = new Card(210, 210, 50, 50); // Allows you to set custom x, y, w, h of the card.
  //c = new Card(Suit.Diamonds, Rank.King, 210, 100, 75, 150); // Specify which card you want to show up.
  //c = new Card(Suit.Hearts, Rank.Queen);
  
  d = new Deck();
}

void draw() {
  background(32);

  //c.draw();
  d.draw();
}

void mousePressed() {
  //c.mousePressed();
  d.mousePressed();
}