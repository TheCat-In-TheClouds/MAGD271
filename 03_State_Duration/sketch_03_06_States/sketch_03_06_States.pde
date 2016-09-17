// 1. Different states of a sketch/app/game can be
//    easily represented with an enumeration. It
//    is also helpful to track not only the current
//    state but the previous state, in case you need
//    to return to play from pause, etc.
GameState currentState;
GameState prevState;

// 2. Elapsed can be represented as stop - start.
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
//    functions when they are entered and exited. They
//    may also repeatedly perform a task while they are
//    sustained.
void draw() {
  background(32);
  textAlign(CENTER, CENTER);
  textSize(42);
  fill(255);
  stateOnSustain();
}

// 3. In a more nuanced implementation of this state machine,
//    states would change based on key press, button press,
//    or timer functionality.
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

// 4. setState takes in the new game state, assigns
//    the current state to the previous state, assigns
//    the new state to the current, then calls
//    on exit (which looks at the previous state) and
//    on enter (which looks at the current state).
void setState(GameState newState) {
  prevState = currentState;
  currentState = newState;
  stateOnExit();
  stateOnEnter();
}

// 5. stateOnExit, stateOnEnter and stateOnSustain
//    work as switchboards, redirecting to a particular
//    state's exiting, entering, or sustaining function.
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
  println("Exiting title. Have fun on your adventure!");
}

void playOnExit() {
  stop = elapsed;
  println("Exiting play, play time was " + (elapsed / 1000.0) + " seconds.");
}

void victoryOnExit() {
  println("Exiting victory. Don't sit on your laurels.");
}

void gameOverOnExit() {
  println("Exiting Game Over. Fall down 7 times, stand up 8.");
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

// 6. Since changing the GameState starts and stops
//    the timer, we can use a fairly simple implementation
//    of duration. However, if we want to do the opposite --
//    have the timer change states based on its elapsed time --
//    we need something more sophisticated.
void titleOnEnter() {
  start = millis();
  println("Welcome! You've now entered the title screen.");
}

void playOnEnter() {
  println("You've entered the arena!");
}

void victoryOnEnter() {
  println("Welcome to Victory.");
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