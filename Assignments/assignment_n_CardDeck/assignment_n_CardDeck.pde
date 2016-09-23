public static boolean ACES_HIGH = true;

//Card c;

Deck d;

void setup() {
  fullScreen();
  //size(680, 420);
  background(64);
  textAlign(CENTER, CENTER);
  textSize(14);

  //c = new Card(Suit.Hearts, Rank.Queen);

  d = new Deck();
}

void draw() {
  // background(32);
  fill(32, 32, 32, 45);
  rect(0, 0, width, height);

  // The traditional dimensions of a playing card are 2.5" x 3.5",
  // which is an aspect ratio of 1 : 1.4 or 0.7143 : 1.
  //c.draw();
  //fill(255);  
  //text(c.toString(), c.pos.x, c.pos.y + c.scale.y * 0.5);

  d.draw();
}

void mousePressed() {
  // if(c.bounds()) { c.flip(); }

  if (mouseButton == LEFT) {
    Card c = d.bounds();
    if (c != null && c.bounds()) { 
      c.flip();
    }
  } else if (mouseButton == RIGHT) {
    d.shuffle();
  }
}