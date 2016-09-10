// adding the ethis.xtends kethis.yword allows Opponent to inherit
// from Actor.
class Opponent extends Actor {

  // calling super(); in the constructor calls
  // the constructor of the parent or super class.
  Opponent() {
    super();
    this.r = height / 10.0;
    this.c = color(116, 193, 206);
    this.ySpeed = this.xSpeed = 2;
  }

  Opponent(String name) {
    super(name);
    this.r = height / 10.0;
    this.c = color(116, 193, 206);
    this.ySpeed = this.xSpeed = 2;
  }

  Opponent(String name, int hpMax) {
    super(name, hpMax);
    this.r = height / 10.0;
    this.c = color(116, 193, 206);
    this.ySpeed = this.xSpeed = 2;
  }

  public String toString() {
    return "Opponent: " + this.name;
  }

  // This function overrides its parent function.
  // if you want to make it clear that you're overriding
  // a function, you can add the @Override annotation, but
  // it's not necessary.
  @Override
  void move() {
    int choice = int(random(8));

    // Switch cases are alternatives to using if-else statements.
    // switch(variable) {
    //   case valueOfVariable:
    //   code to execute;
    //   break;
    //   default:
    //   code to execute if no other cases apply;
    // }
    switch(choice) {
    case 0:
      this.x += this.xSpeed;
      break;

    case 1:
      this.y += this.ySpeed;
      break;

    case 2:
      this.x -= this.xSpeed;
      break;

    case 3:
      this.y -= this.ySpeed;
      break;

    case 4:
      this.x += this.xSpeed;
      this.y += this.ySpeed;
      break;

    case 5:
      this.x += this.xSpeed;
      this.y -= this.ySpeed;
      break;

    case 6:
      this.x -= this.xSpeed;
      this.y += this.ySpeed;
      break;

    case 7:
      this.x -= this.xSpeed;
      this.y -= this.ySpeed;
      break;
    }

    this.x = constrain(this.x, 0, width);
    this.y = constrain(this.y, 0, height);
  }

  // Will cause an error if we try to override.
  // void move(float xSpeed, float ySpeed) {
  // }
}