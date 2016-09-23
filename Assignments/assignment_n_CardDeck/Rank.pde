public enum Rank {
  Ace(ACES_HIGH ? 11 : 1, false), 
    Two(2, false), 
    Three(3, false), 
    Four(4, false), 
    Five(5, false), 
    Six(6, false), 
    Seven(7, false), 
    Eight(8, false), 
    Nine(9, false), 
    Ten(10, false), 
    Jack(10, true), 
    Queen(10, true), 
    King(10, true);

  Integer value;
  boolean isFace;

  private Rank(Integer v, boolean face) {
    this.value = v;
    this.isFace = face;
  }
}