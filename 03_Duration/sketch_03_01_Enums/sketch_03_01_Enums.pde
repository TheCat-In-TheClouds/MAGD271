// 1. Enumerations, abbreviated to enums in Java and Processing,
//    are small sets of discrete values which occur in no specific
//    order and therefore should not be represented as an array.
//    They are often used in conjunction with if() {} blocks
//    to check to see if one action should be performed over another.
//    For example, the Clubs, Spades, Diamonds and Hearts of a deck
//    of cards would ideally be represented by an enum. Enums have
//    more discrete values than a boolean, which can only be true
//    or false, but have fewer possible states than a String.
//    Accounting for and converting between "Clubs", "clubs",
//    CLUBS," "club" and all completely unrelated words is wasteful.
enum Suit {
  CLUBS, 
    SPADES, 
    DIAMONDS, 
    HEARTS;
}

// 2. You can also assign values to enumerations, though this could
//    also be accomplished with a Map (a.k.a. Dictionary).
enum Sandwich {
  PB_AND_J(2.75), 
    BLT(4.25), 
    CHEESESTEAK(5.00), 
    CLUB(3.50), 
    HAM_AND_CHEESE(3.00);

  float value;

  private Sandwich(float v) {
    this.value = v;
  }
}

Suit myCard = Suit.CLUBS;
Sandwich mySandwich = Sandwich.BLT;

void setup() {
  size(420, 420);
  background(32);

  println(myCard);

  println("mySandwich, a " + mySandwich + ", costs $" + mySandwich.value);

  // 3. If you would like to loop through all the values in an enum,
  //    you can use the for-each loop. This says for each value in
  //    the array returned by Sandwich.values(), each one of which we'll
  //    call 's', print out s and its value.
  for (Sandwich s : Sandwich.values()) {
    println(s + " " + s.value);
  }
}

void draw() {
  background(32);

  // 4. Enums can be used in conjunction with either switch-cases or
  //    with if-else blocks, to perform a behavior depending on the enum.
  if (myCard == Suit.CLUBS) {
    fill(255);
    ellipse(210, 210, 360, 360);
  } else if (myCard == Suit.DIAMONDS) {
    fill(255, 0, 0);
    rect(30, 30, 360, 360);
  } else if (myCard == Suit.SPADES) {
    fill(255);
    rect(30, 30, 360, 360);
  } else if (myCard == Suit.HEARTS) {
    fill(255, 0, 0);
    ellipse(210, 210, 360, 360);
  }


  switch(mySandwich) {
  case PB_AND_J: 
    {
      fill(255, 255, 0);
      rect(185, 185, 50, 50);
      break;
    }
  case BLT: 
    {
      fill(255, 0, 255);
      rect(185, 185, 50, 50);
      break;
    }

  case CHEESESTEAK: 
    {
      fill(0, 255, 255);
      rect(185, 185, 50, 50);
      break;
    }
  case CLUB: 
    {
      fill(255, 127, 0);
      rect(185, 185, 50, 50);
      break;
    }
  case HAM_AND_CHEESE: 
    {
      fill(127, 255, 0);
      rect(185, 185, 50, 50);
      break;
    }
  }
}