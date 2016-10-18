/* Code for Flappy Bird is based on Daniel Shiffman's Coding Challenge #31,
 * translated from JavaScript to Java. See https://youtu.be/cXgA1d_E-jY .
 */

StateMachine<GameState> sm;
FlappyBird game;
Duration timer;
Feedback fb;

void setup() {
  //size(680, 420);
  //fullScreen();
  size(512, 128);
  
  // 1. Pipe images are now loaded here to see if
  //    that will improve performance.
  topImg = loadImage("topPipe.png");
  bottomImg = loadImage("bottomPipe.png");

  sm = new StateMachine<GameState>(
    new Title(), 
    new Loss(), 
    new Playing() 
    );

  game = new FlappyBird();

  //timer = new Timer("Flappy Timer");
}

void draw() {
  sm.current.onSustain();
}

void mousePressed() {
  sm.current.onMousePressed();
}

void keyReleased() {
  sm.current.onKeyReleased();
}