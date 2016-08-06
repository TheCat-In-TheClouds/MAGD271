class Character {

  // Four primitive variables which each instance of a character will have.
  String name;
  Integer age;
  Float money;
  Boolean isPlayable;

  // A PVector allows us to conveniently describe spatial position of an
  // object by packaging its x, y and z coordinates together.
  PVector position;

  // Variables which govern how the character is displayed.
  color circleFill;
  color textFill;
  int diameter;

  // A default constructor for a character. Its signature - between the
  // parentheses does not specify any parameters - information that it
  // needs to do its job. It sets the primitive variables above to a
  // standard value.
  Character() {
    name = "Anonymous";
    age = 18;
    money = 0.00f;
    isPlayable = false;
    position = new PVector(width/2, height/2, 0);

    circleFill = color(255, 100, 100);
    textFill = color(0, 0, 0);
    diameter = 25;
  }

  // A constructor with a signature that has four parameters. The
  // constructor assigns the arguments fed into it to the instance
  // variables each time an instance of a Character is created.
  Character(String name, Integer age, Float money, Boolean isPlayable, PVector position) {

    // The variables name, age, money and isPlayable have local scope
    // only. That means that 'name' exists only in the space-time of
    // this Character constructor's action. There is also a variable
    // 'name' which exists so long as an instance of a character exists.
    // How do we tell those two variables, both called 'name', apart?
    // 'this.name' specifies that the variable belonging to this
    // instance of a Character is being assigned the value of the 
    // local 'name' passed into the constructor.

    this.name = name;
    this.age = age;
    this.money = money;
    this.isPlayable = isPlayable;
    this.position = position;

    circleFill = color(255, 0, 0);
    textFill = color(0, 0, 0);
    diameter = 30;
  }

  // Whenever you create your own object, it is a good idea to create
  // your own custom version of this function below. If you use println(
  // new Character()); in void setup() without doing this, you'll
  // see console output like "oopExample$Character@2884d0d2".
  public String toString() {
    return this.name + ", aged " + this.age + ", $" + this.money;
  }

  // This is the definition of a behavior, or method, which each
  // instance of a character can call to show it on the screen.
  void display() {
    fill(circleFill);
    ellipse(this.position.x, this.position.y, diameter, diameter);
    fill(textFill);
    text(this.name, this.position.x, this.position.y);
  }
}