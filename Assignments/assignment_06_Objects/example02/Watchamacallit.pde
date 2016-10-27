import processing.sound.*;

class Watchamacallit {
  SoundFile sound;
  float volume;

  Watchamacallit(PApplet p) {
    this.volume = 0.45;
    this.sound = new SoundFile(p, "soundsnap_laser.mp3");
    this.sound.amp(this.volume);
  }

  void interact() {
    if (key == ' ') {
      this.move();
      this.sound.play();
    }
  }

  void move() {
    pushStyle();
    strokeWeight(12);
    stroke(255, 0, 0, 204);
    line(0, mouseY, width, mouseY);
    strokeWeight(6);
    stroke(255, 255, 0,  204);
    line(0, mouseY, width, mouseY);
    strokeWeight(3);
    stroke(255, 204);
    line(0, mouseY, width, mouseY);
    popStyle();
  }
}