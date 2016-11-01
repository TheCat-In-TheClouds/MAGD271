// The old way.
//float x;
//float y;
Mimsy mmmm;
//Mimsy[] ms;

void setup() {
  //size(680, 420);
  fullScreen();
  background(0);
  
  // The old way.
  //x = width / 2.0;
  //y = height / 2.0;
  mmmm = new Mimsy();
  //ms = new Mimsy[400];
  //for(int i = 0; i < 400; ++i) {
  //  ms[i] = new Mimsy();
  //}
}

void draw() {
  //background(32);
  // The old way.
  //ellipse(x, y, 40, 40);
  mmmm.show();
  mmmm.interact();
  //for(int i = 0; i < 400; ++i) {
  //  ms[i].show();
  //  ms[i].interact();
  //}
}