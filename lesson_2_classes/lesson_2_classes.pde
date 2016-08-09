Character johnDoe;
Character hero;
Orc lackey;
Wizard wizkid;

void setup() {
  size(500, 500);
  background(255);
  noStroke();
  smooth();
  rectMode(CENTER);
 
  // Create Character instances by calling a constructor with the 'new' keyword.
  johnDoe = new Character();
  hero = new Character("Ashley", 25, 10.00f, true, new PVector(width/4, height/4, 0));
  
  // Create Orc instances
  lackey = new Orc("Orkryx", 42, 0.01f, false, new PVector(350,350,0), 15);
  
  // Create Wizard instances
  wizkid = new Wizard();
}

void draw() {
  // Display characters
  johnDoe.display();
  hero.display();
  
  // Display orcs
  lackey.display();
  
  // Display wizards
  wizkid.display(true);
}