static final Rank[] RANKS = Rank.values();
static final Suit[] SUITS = Suit.values();

// For an object to be comparable with other objects, it must
// implement an Interface. An Interface is like a contract
// which a class signs. A class would be motivated to do this
// because the class wants to interact with other classes
// and functions in a library. In this case, we want our
// custom Card class to play nicely with sorting. Once Card
// has signed this contract, the Interface will demand that
// Card define certain functions, in this case compareTo().
// The generic typing, <Card> specifies that we only care about
// comparing a card with another card, we don't need to compare
// a card to an instance of a duck or of a helicopter.

// Notice that one class can agree to multiple Interfaces. The
// "Icard" interface demonstrates that you can write your own.
class Card implements Comparable<Card>, ICard {
  String name;
  Integer value;
  Integer suitAsInteger;
  Integer rankAsInteger;
  color clr;
  Suit suit;
  Rank rank;

  Card(Suit suit, Rank rank) {
    this.suit = suit;
    this.rank = rank;
    this.name = this.rank + " of " + this.suit;

    this.suitAsInteger = (Integer)this.suit.ordinal();
    this.rankAsInteger = (Integer)this.rank.ordinal();

    if (this.rank == Rank.Ace && acesHigh) {
      this.value = 11;
    } else {
      this.value = constrain(this.rank.ordinal() + 1, 0, 10);
    }

    if (this.suit == Suit.Hearts || this.suit == Suit.Diamonds) {
      this.clr = color(255, 0, 0);
    } else {
      this.clr = color(0);
    }
  }

  public String toString() {
    return this.name + " " + this.value;
  }

  // The Comparable<Card> interface requires us to define this.
  public int compareTo(Card card) {
    // First we sort by suit.
    int suitComparison = this.suitAsInteger.compareTo(card.suitAsInteger);

    // If this card and the comparisand card are of the same suit, the function
    // compareTo() will return 0. If it returns 0, then we want to next compare
    // the cards based on rank. The function compareTo is available to the object
    // version of Integer, but not to the primitive variable int.
    if (suitComparison == 0) {
      return this.rankAsInteger.compareTo(card.rankAsInteger);
    } else {
      return suitComparison;
    }
  }

  int compareValue(Card card) {
    return this.value.compareTo(card.value);
  }

  boolean sameSuit(Card card) {
    return this.suit == card.suit;
  }

  boolean sameRank(Card card) {
    return this.rank == card.rank;
  }

  boolean sameColor(Card card) {
    return this.clr == card.clr;
  }

  public void display(int placeInHand) {
    fill(64);
    float x = width * placeInHand/5.0 + cardDisplayOffset;
    float y = height / 2.0;
    float w = 40;
    float h = 60;
    rect(x, y, w, h, 4.0);
    fill(this.clr);
    if (this.suit == Suit.Clubs) {
      ellipse(x + 5, y + 5, 12, 12);
    } else if (this.suit == Suit.Diamonds) {
      rect(x + 5, y + 5, 12, 12);
    } else if (this.suit == Suit.Hearts) {
      ellipse(x + 5, y + 5, 12, 12);
    } else if (this.suit == Suit.Spades) {
      rect(x + 5, y + 5, 12, 12);
    }
    fill(255);
    text(this.rankAsInteger + 1, x + 2, y + h - 2);
  }
}