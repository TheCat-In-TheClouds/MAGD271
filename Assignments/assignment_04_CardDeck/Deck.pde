import java.util.*;

class Deck {
  private Stack<Card> cards;
  Rank[] ranks = Rank.values();
  Suit[] suits = Suit.values();
  int r, s, count, margin = 10;
  PVector[] places;
  float shuffleSpeed = 0.075;

  // CONSTRUCTORS

  Deck() {
    this.cards = new Stack<Card>();

    ranks = Rank.values();
    suits = Suit.values();
    r = ranks.length; // 13
    s = suits.length; // 04
    count = r * s;    // 52
    places = new PVector[count];

    for (int i = 0; i < count; ++i) {
      // Since suits change at an interval of 4 and ranks
      // at an interval of 13 we can use modulos.
      this.cards.add(new Card(suits[i % s], 
        ranks[i % r], 
        random(width * 0.25, width * 0.75), 
        random(height * 0.25, height * 0.75), 
        width / float(r) - margin, 
        height / float(s) - margin));
      places[i] = new PVector(((i % r) * width / float(r)) + width / float(r) / 2.0, 
        ((i % s) * height / float(s)) + height / float(s) / 2.0);
    }
  }

  // OVERRIDES

  public String toString() {
    return this.cards.toString();
  }

  public void shuffle() {
    Collections.shuffle(this.cards);
    for (int i = 0; i < count; ++i) {
      places[i] = new PVector(((i % r) * width / float(r)) + width / float(r) / 2.0, 
        ((i % s) * height / float(s)) + height / float(s) / 2.0);
    }
  }

  public void sort() {
    Collections.sort(this.cards);
  }

  public Card get(int i) {
    if (i >= 0 && i < this.cards.size()) {
      return this.cards.get(i);
    }
    return null;
  }

  public Card deal() {
    if (this.cards.size() > 0) {
      return this.cards.pop();
    }
    return null;
  }

  public void draw() {
    for (int i = 0; i < count; ++i) {
      Card c = this.cards.get(i);
      c.moveTo(places[i], this.shuffleSpeed);
      c.draw();
    }
  }

  public void mousePressed() {
    if (mouseButton == LEFT) {
      Card c = this.bounds();
      if (c != null && c.bounds()) { 
        c.flip();
      }
    } else if (mouseButton == RIGHT) {
      this.shuffle();
    }
  }

  public Card bounds() {
    for (int i = 0; i < count; ++i) {
      if (this.cards.get(i).bounds()) {
        return this.cards.get(i);
      }
    }
    return null;
  }
}