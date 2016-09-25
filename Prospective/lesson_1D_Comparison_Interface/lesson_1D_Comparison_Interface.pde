// So, we should have enough to make a game of cards, right? 
// A few concerns pop up: A deck of 52 cards can be grouped
// into 4 Suits of 13 Ranks each. A 2D array won't work: a deck
// may shrink unevenly with more Clubs than Diamonds being dealt.
// There is no functional difference between a Club than a Heart:
//                  Card
//         __________|_________
//        /    \       \       \
//    Spades  Clubs  Hearts  Diamonds
// doesn't seem to make sense either. This is where enums can
// come in handy. What's more, Aces can be high or low in value,
// and the values of face cards are the same (10) in a game
// like Blackjack, while other games may claim Queen > Jack.
// How do we make a 'Card' a complex object which retains
// a lot of info, but can efficiently be compared? An enumeration
// might be helpful here. It comes in handy when there are a
// limited number of key terms, such as days in a week or coinage
// which are used in if() comparisons. Another helpful tool would
// be to implement interfaces designed for comparisons.

import java.util.*;

Stack<Card> deck;
List<Card> hand;
boolean acesHigh = true;
float cardDisplayOffset = 20;

void setup() {
  size(420, 420);
  background(32);
  noStroke();
  ellipseMode(CORNER);

  // You could make a list of cards, but a deck is more
  // accurately represented by a stack. Like a stack of
  // dishes or an Inbox full of unread email, the first
  // object in is often the last object out (FILO).
  deck = new Stack<Card>();
  hand = new ArrayList<Card>();
  for (int i = 0; i < 52; ++i) {
    // Since suits change at an interval of 4 and ranks
    // at an interval of 13 we can use modulos. Java enums
    // cannot be translated to and from an underlying value
    // as easily as enums in other programming languages,
    // hence the constant arrays SUITS and RANKS.
    deck.add(new Card(SUITS[i % 4], RANKS[i % 13]));
  }

  Collections.sort(deck);
  println("SORTED BY SUIT THEN BY RANK (DEFAULT):\r\n" + deck);

  // If we require multiple ways of sorting cards, we can set a
  // default comparison and use it as above. We can then create
  // several alternative comparitors, like the SortByValue class,
  // and pass them as a second argument to the Collections.sort()
  // function.
  Collections.sort(deck, new SortByValue());
  println("\r\nSORTED BY VALUE:\r\n" + deck);

  Collections.shuffle(deck);
  println("\r\nSHUFFLED:\r\n" + deck + "\r\n");
}

void draw() {
  background(32);
  int size = hand.size();
  for(int i = 0; i < size; ++i) {
    hand.get(i).display(i);
  }
}

void mousePressed() {
  if (mouseButton == LEFT && deck.size() > 0 && hand.size() < 5) {
    // Pops the object that is on the top of
    // the deck and adds it to the hand.
    hand.add(deck.pop());
  } else if(mouseButton == RIGHT && hand.size() > 0) {
    hand.remove(hand.get(0));
  }
  println("Your hand: " + hand);
}