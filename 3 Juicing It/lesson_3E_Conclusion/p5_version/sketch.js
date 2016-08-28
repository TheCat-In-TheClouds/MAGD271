var score = 0;
var brickRows = 8;
var brickCols = 10;
var cam;
var ball;
var paddle;
bricks = [];
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
  noCursor();
  rectMode(RADIUS);
  ellipseMode(RADIUS);

  cam = new Camera();
  ball = new Ball();
  paddle = new Paddle();

  for (var row = 0; row < brickRows; ++row) {
    for (var col = 0; col < brickCols; ++col) {
      var c = color(map(col, 0, brickCols, 255, 0), map(row, 0, brickRows, 0, 255), map(col, 0, brickCols, 0, 255));
      bricks.push(new Brick(row, col, c));
    }
  }

  if (scoreFont != null) {
    textFont(scoreFont);
  }
  textSize(48);
}

function draw() {
  background(32, 32, 32);

  cam.show();
    
  var size = bricks.length;
  for (var i = size - 1; i >= 0; --i) {
    if (ball.hitBrick(bricks[i])) {
      break;
    }
  }

  ball.move();
  ball.fallInPit();
  ball.hitCeiling();
  ball.hitPaddle(paddle);
  ball.bounceSideWalls();
  ball.show();
    
  cam.restore();

  size = bricks.length;
  for (var i = size - 1; i >= 0; --i) {
    bricks[i].show(i);
  }

  paddle.move();
  paddle.show();

  fill(255);
  text(score, 10, 52);
}