class Wizard extends Character {

  // A special attribute which wizards have but characters do not.
  Integer magicPower;

  Wizard() {
    super();

    this.magicPower = 500;

    this.position = new PVector(random(0, width), random(0, height), 0);
    this.circleFill = color(#C96CBD);
  }

  // Wizards look different than other characters, so their
  // display() method has to override the usual Character
  // display() which the Wizard class inherits. You don't
  // have to mark these overrides with the '@Override' annotation
  // in Processing, but it might be a useful note to make
  // to yourself so you remember what you're overriding.
  @Override
    void display() {
    fill(circleFill);
    rect(this.position.x, this.position.y, diameter, diameter);
    fill(textFill);
    text(this.name, this.position.x, this.position.y);
  }

  // Suppose that for whatever reason, sometimes wizards appear
  // with a golden glow around them. You might want to create
  // a function which operates like display above, but gives you
  // the option to choose whether or not the wizard glows.
  // You can create a function with the same name, but with a
  // different signature (in other words, a different list of
  // parameters between the parentheses). Not to be confused
  // with overriding, this is called function overloading.
  void display(boolean isGlowing) {
    if (isGlowing) {
      fill(color(255, 255, 0));
      ellipse(this.position.x, this.position.y, diameter*2f, diameter*2f);
    }
    fill(circleFill);
    rect(this.position.x, this.position.y, diameter, diameter);
    fill(textFill);
    text(this.name, this.position.x, this.position.y);
  }
}