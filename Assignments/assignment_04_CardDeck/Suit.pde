// See https://docs.oracle.com/javase/tutorial/java/javaOO/enum.html

public enum Suit {
  Clubs(Color.Black), 
    Spades(Color.Black), 
    Diamonds(Color.Red), 
    Hearts(Color.Red);

  Color value;

  private Suit(Color v) {
    this.value = v;
  }
}