// An orc is a kind of character, so it uses the keyword 'extends' so that
// it can inherit from and have access to the behaviors and attributes
// that the Character class provides. A class which extends - inherits from -
// another class is called a 'derived class', 'child class' or 'sub-class'.
class Orc extends Actor {

  // A special attribute which orcs have but characters do not.
  Integer attackPower;

  Orc() {

    // We don't have to declare these variables. The class
    // Orc has access to them by virtue of being a derived class.
    
    name = "Anonymous";
    age = 18;
    money = 0.00f;
    isPlayable = false;
    position = new PVector(width/2, height/2, 0);

    circleFill = color(100, 255, 100);
    textFill = color(255, 0, 255);
    diameter = 35;
  }

  Orc(String name, Integer age, Float money, Boolean isPlayable, PVector position, int attackPower) {

    // The Orc class constructor can call on its parent or super class
    // constructor to do some initialization work for it. In this case,
    // the constructor called is Character(String name, Integer age,
    // Float money, Boolean isPlayable, PVector position).
    
    super(name, age, money, isPlayable, position);
    
    // The orc has one variable which characters don't,
    // so the Orc constructor has to take care of initializing it.
    
    this.attackPower = attackPower;

    circleFill = color(100, 255, 100);
    textFill = color(255, 0, 255);
    diameter = 35;
  }

}