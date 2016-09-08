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

// A one-dimensional array of objects. We could initialize this
// with curly braces like in the commented out code below. However
// the contructors of these objects determines the radii of the
// ellipses based on the dimensions of the screen, which hasn't
// been determined by the setup() function yet.

// Actor[] actors = {
//    new Player("Alicia"), 
//    new Actor("Patricia"), 
//    new Opponent("Samuel"), 
//    new Actor("Hank")
//  };

Actor[] actors;
int actorSize = 4;

PFont times;

void setup() {
  background(32);
  // size(420, 420);
  fullScreen();
  ellipseMode(RADIUS);
  noStroke();
  noCursor();

  times = createFont(PFont.list()[411], 36);
  textFont(times, 36);
  textAlign(CENTER, CENTER);

  actors = new Actor[actorSize];
  actors[0] = new Player("Alicia");
  actors[1] = new Actor("Patricia");
  actors[2] = new Opponent("Samuel");
  actors[3] = new Actor("Hank");

  // Syntax of for(
  // initialize iterator; when used with arrays this is usually int i = 0;
  // check boolean condition; when used with arrays this is usually i < array.length;
  // perform unary operation on iterator
  // ) { } For loops have a signature and curly braces containing instructions.
  for (int i = 0; i < actorSize; ++i) {
    actors[i].x = random(0, width);
    actors[i].y = random(0, height);
  }
}

void draw() {
  fill(32, 32, 32, 54);
  rect(0, 0, width, height);
  
  
  // When a child or sub-class's functionality overrides
  // the parent's functionality, this is called polymorphism.
  // move() is polymorphic, but show() is not.
  for (int i = 0; i < actorSize; ++i) {
    actors[i].move();
    actors[i].show();
    actors[i].collide(actors);
  }
}

void mousePressed() {
  exit();
}