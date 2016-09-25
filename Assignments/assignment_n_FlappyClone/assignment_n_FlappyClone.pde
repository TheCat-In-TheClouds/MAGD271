/* Code for Flappy Bird is based on Daniel Shiffman's Coding Challenge #31,
 * translated from JavaScript to Java. See https://youtu.be/cXgA1d_E-jY .
 */

StateMachine sm;
FlappyBird game;
Duration timer;
Feedback fb;

void setup() {
  size(680, 420);
  //fullScreen();

  sm = new StateMachine(new Title(), 
    new Loss(), 
    new Playing() 
    );

  game = new FlappyBird();

  timer = new Timer("Flappy Timer");
}

void draw() {
  sm.onSustain();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    sm.onMousePressed();
  } else {
    save(millis() + ".png");
  }
}

void keyReleased() {
  sm.onKeyReleased();
}