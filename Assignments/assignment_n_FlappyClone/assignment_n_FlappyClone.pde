/* Code for Flappy Bird is based on Daniel Shiffman's Coding Challenge #31,
 * translated from JavaScript to Java. See https://youtu.be/cXgA1d_E-jY .
 */

StateMachine<GameState> sm;
FlappyBird game;
Duration timer;
Feedback fb;

void setup() {
  size(680, 420);
  //fullScreen();
  //frameRate(30);

  sm = new StateMachine<GameState>(
    new Title(), 
    new Loss(), 
    new Playing() 
    );

  game = new FlappyBird();

  timer = new Timer("Flappy Timer");
}

void draw() {
  sm.current.onSustain();
}

void mousePressed() {
  sm.current.onMousePressed();
}