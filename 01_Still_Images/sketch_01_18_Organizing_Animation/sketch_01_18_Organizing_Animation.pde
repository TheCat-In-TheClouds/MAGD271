PImage batFlySrc;
PImage heroWalkSrc;
PImage flowerBobSrc;

// 1. The code is starting to get messy and redundant, so
//    it would help to organize it. Instead of updating the
//    current frame of an animation in the main sketch, we'll
//    move all that object to a class we've defined called
//    Animation and then construct 3 instances of that class
//    for the bat, hero, and flower.
Animation batFly;
Animation heroWalk;
Animation flowerBob;

void setup() {
  size(680, 420);
  background(64);
  batFlySrc = loadImage("batFly.png");
  heroWalkSrc = loadImage("heroWalk.png");
  flowerBobSrc = loadImage("flowerBob.png");
  
  // 2. The problem that arises from delegating a lot of logic
  //    to another class is that, in order to set up the proper
  //    construction of an object that can handle many possible
  //    arrangements of the source file, you need to pass A LOT
  //    of info to your constructor. Create multiple constructors,
  //    some which require less information, but make more unsafe
  //    assumptions, so you have options.
  // batFly = new Animation(batFlySrc, 32, 32,
  //   batFlySrc.width / 32, 0, 0);
  batFly = new Animation(batFlySrc, batFlySrc.width / 32);
  heroWalk = new Animation(heroWalkSrc, heroWalkSrc.width / 32);
  flowerBob = new Animation(flowerBobSrc, flowerBobSrc.width / 32);
  
  frameRate(12);
}

void draw() {
  fill(32, 32, 32, 127);
  rect(0, 0, width, height);
  batFly.show(width / 3.0, height / 2.0, 64, 64);
  heroWalk.show(width / 2.0, height / 2.0, 64, 64);
  flowerBob.show(width * 2 / 3.0, height / 2.0, 64, 64);
}