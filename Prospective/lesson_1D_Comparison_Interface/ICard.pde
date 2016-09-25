// Note that you can write your own interfaces. Suppose you want
// to make a deck building game which can be expanded later on by
// later programmers. You don't know what they'll want to add in
// the future, but you know that to avoid breaking the base game,
// new cards will have to have certain variables and methods.
interface ICard {
   // Uncomment this and you will see that Processing will
   // complain that Card doesn't define this method.
   // abstract void demandedMethod();
   
   abstract void display(int i);
}