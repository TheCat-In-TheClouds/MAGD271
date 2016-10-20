import java.util.*;

// 1. It would be helpful to not have a bunch of animations
//    and an animator out in the open, but rather to organize
//    them into an actor.
Actor hero;
float elevation;

void setup() {
  //size(680, 420);
  fullScreen();
  background(64);
  hero = new Actor();
  elevation = random(height * 0.75, height * 0.85);
}

void draw() {
  background(32);
  
  strokeWeight(1);
  line(0, elevation, width, elevation);
  hero.draw();
  stroke(255);
}

void keyPressed(KeyEvent e) {
  hero.keyPressed(e);
}

void keyReleased(KeyEvent e) {
  hero.keyReleased(e);
}