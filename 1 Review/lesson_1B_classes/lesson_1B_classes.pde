Actor johnDoe;
Actor hero;
Orc lackey;
Wizard wizkid;

void setup() {
  size(420, 420);
  background(32);
  noStroke();
  smooth();
  rectMode(CENTER);
 
  // Create Character instances by calling a constructor with the 'new' keyword.
  johnDoe = new Actor();
  hero = new Actor("Ashley", 25, 10.00, true, new PVector(width/4.0, height/4.0, 0));
  
  // Create Orc instances
  lackey = new Orc("Orkryx", 42, 0.01, false, new PVector(350, 350, 0), 15);
  
  // Create Wizard instances
  wizkid = new Wizard();
  
  println(johnDoe);
  println(hero);
  println(lackey);
  println(wizkid);
}

void draw() {
  background(32);
  // Display characters
  johnDoe.display();
  hero.display();
  
  // Display orcs
  lackey.display();
  
  // Display wizards
  wizkid.display(true);
}