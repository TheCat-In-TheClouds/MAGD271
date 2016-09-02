  // Creating a class which implements Comparator<YourClass>
// and then defines the function public int compare(YourClass a, YourClass b)
// will let you create multiple methods of sorting an object according to
// different variables in YourClass.
class SortByValue implements Comparator<Card> {
  public int compare(Card a, Card b) {
    return a.value.compareTo(b.value);
  }
}