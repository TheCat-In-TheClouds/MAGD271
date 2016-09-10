import java.util.*;

int score = 0;
int brickRows = 8;
int brickCols = 10;
Ball ball;
Paddle paddle;
List<Brick> bricks;
PFont scoreFont;

void setup() {
  size(420, 420);
  background(32);

  noStroke();
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  noCursor();

  ball = new Ball();
  paddle = new Paddle();

  bricks = new ArrayList<Brick>();
  for (int row = 0; row < brickRows; ++row) {
    for (int col = 0; col < brickCols; ++col) {
      color c = color(map(col, 0, brickCols, 255, 0), map(row, 0, brickRows, 0, 255), map(col, 0, brickCols, 0, 255));
      bricks.add(new Brick(row, col, c));
    }
  }

  scoreFont = loadFont("SourceCodePro-Regular-48.vlw");
  textFont(scoreFont);
}

void draw() {
  background(32);

  paddle.move();

  int size = bricks.size();
  for (int i = size - 1; i >= 0; --i) {
    if (ball.hitBrick(bricks.get(i))) {
      break;
    }
  }

  ball.move();
  ball.fallInPit();
  ball.hitCeiling();
  ball.hitPaddle(paddle);
  ball.bounceSideWalls();

  ball.show();
  paddle.show();
  size = bricks.size();
  for (int i = size - 1; i >= 0; --i) {
    bricks.get(i).show(i);
  }

  fill(255);
  text(score, 10, 52);
}