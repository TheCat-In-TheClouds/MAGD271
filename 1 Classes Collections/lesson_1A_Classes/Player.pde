class Player extends Actor {

  float damping = 1;

  Player() {
    super();
    this.r = height / 12.0;
    this.c = color(242, 204, 47);
  }

  Player(String name) {
    super(name);
    this.r  = height / 12.0;
    this.c = color(242, 204, 47);
  }

  Player(String name, int hpMax) {
    super(name, hpMax);
    this.r  = height / 12.0;
    this.c = color(242, 204, 47);
  }

  public String toString() {
    return "Player: " + this.name;
  }

  @Override
  void move() {
    this.x += (mouseX - this.x) * this.damping;
    this.y += (mouseY - this.y) * this.damping;
  }

  void collide(Actor[] actors) {
    int size = actors.length;
    for (int i = 0; i < size; ++i) {

      // The instanceof keyword can be used to check if an instance
      // of an object is of a certain data type. We don't care about
      // the player instance colliding with itself.
      if (actors[i] instanceof Player == false) {
        float dist = dist(this.x, this.y, actors[i].x, actors[i].y);

        // If the distance between two circles is less than the sum
        // of their diameter, then the circles are colliding.
        if (dist < this.r + actors[i].r) {
          if (actors[i] instanceof Opponent) {
            this.hpCurrent = constrain(this.hpCurrent - 1, 0, this.hpMax);
            actors[i].hpCurrent = constrain(actors[i].hpCurrent - 1, 0, actors[i].hpMax);
          } else {
            actors[i].xDirection = -actors[i].xDirection;
            actors[i].yDirection = -actors[i].yDirection;
            this.hpCurrent = constrain(this.hpCurrent - 1, 0, this.hpMax);
          }
        }
      }
    }
  }
}