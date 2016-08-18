// The classes Opponent and Player inherit from, or extend,
// the parent or super class Actor.

//      Actor
//      /  \
// Player  Opponent

// A common phrase is to say that classes have IS A and HAS A
// relationships: a player IS A(n) actor, and HAS A name.
// the inheritance relationship goes only one direction. The child
// or sub-classes Opponent and Player can use and refine the
// variables and functions of the parent or super-class Actor
// but Actor cannot use methods and variables of its children.

// A one-dimensional array of objects.
Actor[] actors = {
  new Player("Alicia"), 
  new Actor("Patricia"), 
  new Opponent("Samuel"), 
  new Actor("Hank")
};
int actorSize;

void setup() {
  background(32);
  size(420, 420);
  ellipseMode(RADIUS);
  actorSize = actors.length;

  // Syntax of for(
  // initialize iterator; when used with arrays this is usually int i = 0;
  // check boolean condition; when used with arrays this is usually i < array.length;
  // perform unary operation on iterator
  // ) { } For loops have a signature and curly braces containing instructions.
  for(int i = 0; i < actorSize; ++i) {
   actors[i].x = random(0, width);
   actors[i].y = random(0, height);
  }
}

void draw() {
  background(32);
  for(int i = 0; i < actorSize; ++i) {
    actors[i].move();
    actors[i].show();
    actors[i].collide(actors);
  }
}