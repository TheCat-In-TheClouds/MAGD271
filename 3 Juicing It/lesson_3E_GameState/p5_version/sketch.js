var cam;
var ball;
var paddle;

var brickRows = 8;
var brickCols = 10;
bricks = [];

var score = 0;
var scoreFont;

var GameState = { Title: "Title", Playing: "Playing", Victory: "Victory", Paused: "Paused" };
var currentState;
var previousState;

function setup() {
    createCanvas(420, 420);
    canvas.oncontextmenu = function (e) { e.preventDefault(); };
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

    setState(GameState.Playing);
}

function draw() {
    routine();
}

function mouseReleased() {
    if(currentState == GameState.Title) {
        if(mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
            setState(GameState.Playing);
        }
    } else if(currentState === GameState.Paused) {
        if(mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
            setState(previousState);
        }
    } else if(currentState === GameState.Victory) {
        if(mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
            setState(GameState.Title);
        }
    } else {
        setState(GameState.Paused);
    }
}

function setState(requestedState) {
    previousState = currentState;
    currentState = requestedState;
    if(requestedState === GameState.Playing) {
        routine = play;
    } else if(requestedState === GameState.Victory) {
        routine = victory;
    } else if(requestedState === GameState.Title) {
        if(previousState === GameState.Victory) {
            score = 0;
            cam = new Camera();
            ball = new Ball();
            paddle = new Paddle();
            bricks = [];
            for (var row = 0; row < brickRows; ++row) {
                for (var col = 0; col < brickCols; ++col) {
                    var c = color(map(col, 0, brickRows, 0, 255), map(row, 0, brickCols, 0, 255), map(col, 0, brickRows, 255, 0));
                    bricks.push(new Brick(row, col, c));
                }
            }
        }
        
        routine = title;
    } else {
        routine = paused;
    }
}

function routine() {

}

function title() {
    background(32, 32, 32);
    fill(255);
    textSize(42);
    text("JUICY BREAKOUT", 10, height - 10);
    textSize(16);
    text("Click to play.", 10, height - 45);
    fill(0, 127, 205);
    ellipse(mouseX, mouseY, 3, 3);
}

function paused() {
    background(32, 32, 32);
    ball.show();
    var size = bricks.length;
    for (var i = size - 1; i >= 0; --i) {
        bricks[i].show(i);
    }
    paddle.show();
    fill(255);
    text(score, 10, 52);
    fill(0, 0, 0, 127);
    rect(width / 2.0, height / 2.0, width / 2.0, height / 2.0);
    fill(255);
    text(score, 10, 52);
    fill(255);
    text("PAUSED", 10, height - 10);
}

function play() {
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
    textSize(48);
    text(score, 10, 52);
    
    if(bricks.length <= 0) {
        setState(GameState.Victory);
    }
}

function victory() {
    background(32, 32, 32);
    fill(255);
    textSize(42);
    text("VICTORY", 10, height - 10);
    textSize(16);
    text("Click to return to title.", 10, height - 45);
    fill(0, 127, 205);
    ellipse(mouseX, mouseY, 3, 3);
}