int score = 0;
Ball ball;
Paddle paddle;
PFont scoreFont;

void setup() {
  size(420, 420);
  background(32);

  noStroke();
  rectMode(RADIUS);
  ellipseMode(RADIUS);

  ball = new Ball();
  paddle = new Paddle();
  
  scoreFont = loadFont("SourceCodePro-Regular-48.vlw");
  textFont(scoreFont);
}

void draw() {
  background(32);
  ball.move();
  ball.fallInPit();
  ball.crossGoal();
  ball.hitPaddle(paddle);
  ball.bounceSideWalls();

  ball.show();
  paddle.show();
  
  fill(255);
  text(score, 10, 52);
}

void keyPressed() {
  paddle.move();
}