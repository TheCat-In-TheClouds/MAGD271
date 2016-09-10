var score = 0;
var ball;
var paddle;
var scoreFont;

function preload() {
  // If you run a local copy of the index.html file in Chrome or Safari, you will
  // receive an error because there are security features in place which prevent
  // this font from being loaded.
  // scoreFont = loadFont('assets/SourceCodePro-Regular.ttf');
}

function setup() {
  createCanvas(420, 420);
  background(32);
  noStroke();
  rectMode(RADIUS);
  ellipseMode(RADIUS);

  ball = new Ball();
  paddle = new Paddle();
  if (scoreFont != null) {
    textFont(scoreFont);
  }
  textSize(48);
}

function draw() {
  background(32);
  ball.move();
  ball.fallInPit();
  ball.crossGoal();
  ball.hitPaddle(paddle);
  ball.bounceSideWalls();
  ball.show();

  paddle.move();
  paddle.show();

  fill(255)
  text(score, 10, 52);
}