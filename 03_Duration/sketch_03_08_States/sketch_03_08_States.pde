// 1. Different states of a sketch/app/game can be
//    easily represented with an enumeration. It
//    is also helpful to track not only the current
//    state but the previous state, in case you need
//    to return to play from pause, etc.
GameState currentState;
GameState prevState;

// 2. Elapsed is easily represented as millis() - start.
int start;
int elapsed;
int stop;

void setup() {
  size(420, 420);
  background(64);
  currentState = GameState.TITLE;
  prevState = null;
}

// 2. An enum is not enough. States may trigger one-off
//    functions when they are ENTERED and EXITED. They
//    may also regularly perform tasks while they are
//    sustained.
void draw() {
  background(32);
  textAlign(CENTER, CENTER);
  textSize(42);
  fill(255);
  stateOnSustain();
}

// 3. In a more nuanced implementation of this state engine,
//    states would change based on key or button presses.
void mousePressed() {
  if (currentState == GameState.TITLE) {
    setState(GameState.PLAYING);
  } else if (currentState == GameState.PLAYING) {
    setState(GameState.VICTORY);
  } else if (currentState == GameState.VICTORY) {
    setState(GameState.GAMEOVER);
  } else if (currentState == GameState.GAMEOVER) {
    setState(GameState.PAUSED);
  } else if (currentState == GameState.PAUSED) {
    setState(GameState.TITLE);
  }
}

// 4. setState takes in the new game state and
//    assigns it to current and previous states,
//    then manages the exiting and entering functions.
void setState(GameState newState) {
  prevState = currentState;
  currentState = newState;
  stateOnExit();
  stateOnEnter();
}

// 5. stateOnExit, stateOnEnter and stateOnSustain
//    work entirely as switchboards, redirecting to a
//    particular state's exiting and entering function.
//
void stateOnExit() {
  if (prevState != null) {
    if (prevState == GameState.TITLE) {
      titleOnExit();
    } else if (prevState == GameState.PLAYING) {
      playOnExit();
    } else if (prevState == GameState.VICTORY) {
      victoryOnExit();
    } else if (prevState == GameState.GAMEOVER) {
      gameOverOnExit();
    } else if (prevState == GameState.PAUSED) {
      pausedOnExit();
    }
  }
}

void titleOnExit() {
  println("Leaving title. Have fun on your adventure.");
}

void playOnExit() {
  stop = elapsed;
  println("You're leaving the mission area. " + stop);
}

void victoryOnExit() {
  println("Don't sit on your laurels.");
}

void gameOverOnExit() {
  println("Rejoining the fight.");
}

void pausedOnExit() {
  println("Game resumed.");
}

void stateOnEnter() {
  if (currentState == GameState.TITLE) {
    titleOnEnter();
  } else if (currentState == GameState.PLAYING) {
    playOnEnter();
  } else if (currentState == GameState.VICTORY) {
    victoryOnEnter();
  } else if (currentState == GameState.GAMEOVER) {
    gameOverOnEnter();
  } else if (currentState == GameState.PAUSED) {
    pausedOnEnter();
  }
}

void titleOnEnter() {
  start = millis();
  println("Welcome! You've now entered the title screen.");
}

void playOnEnter() {
  println("You've entered the arena!");
}

void victoryOnEnter() {
  println("Victory.");
}

void gameOverOnEnter() {
  println("Game Over.");
}

void pausedOnEnter() {
  println("You just paused the game.");
}

void stateOnSustain() {

  if (currentState == GameState.TITLE) {
    titleOnSustain();
  } else if (currentState == GameState.PLAYING) {
    playOnSustain();
  } else if (currentState == GameState.VICTORY) {
    victoryOnSustain();
  } else if (currentState == GameState.GAMEOVER) {
    gameOverOnSustain();
  } else if (currentState == GameState.PAUSED) {
    pausedOnSustain();
  }
}

void titleOnSustain() {
  text("TITLE SCREEN", width / 2.0, height / 2.0);
}

void playOnSustain() {
  text("PLAYING", width / 2.0, height / 2.0);
  elapsed = millis() - start;
  text(elapsed / 1000, width / 2.0, height * 3 / 4.0);
}

void victoryOnSustain() {
  text("VICTORY", width / 2.0, height / 2.0);
}

void gameOverOnSustain() {
  text("GAME OVER", width / 2.0, height / 2.0);
}

void pausedOnSustain() {
  text("PAUSED", width / 2.0, height / 2.0);
}