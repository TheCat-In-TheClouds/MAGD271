// 1. State Machines can have many different applications, for
//    example one state machine can be used to move the player
//    from the title screen to the options menu, while another
//    changes the animation from idling to walking when you
//    press an arrow key. This is why the StateMachine class
//    uses the < > angle brackets, because we need to specify
//    what kind of state it is going to be managing.
StateMachine<Animation> animator;

// 2. An animation is a glorified collection of PImages and
//    a way of iterating over them.
Animation idle;
Animation walk;

void setup() {
  size(680, 420);
  background(64);

  // 3. The idle animation is created by loading images into
  //    the Animation constructor. Remember that you can right
  //    click on the Animation constructor call and click on
  //    Show Usage to see where else the constructor is used and
  //    to go to the function's definition.
  idle = new Animation("Idle", 8, 
    loadImage("idle01.png"), 
    loadImage("idle02.png"), 
    loadImage("idle03.png"), 
    loadImage("idle04.png"), 
    loadImage("idle05.png"));

  // 4. Some additional properties can be used to
  //    set the location and scale of the animation. 
  idle.offsetX = width * 0.125;
  idle.offsetY = height * 0.5;
  idle.w = 64;
  idle.h = 64;

  walk = new Animation("Walk", 8, 
    loadImage("walk01.png"), 
    loadImage("walk02.png"), 
    loadImage("walk03.png"), 
    loadImage("walk04.png"));

  walk.offsetX = width * 0.125;
  walk.offsetY = height * 0.5;
  walk.w = 64;
  walk.h = 64;

  // 5. Add the animations to the state machine.
  //    The first animation added to the state machine
  //    is treated as the current or 'entry' state.
  animator = new StateMachine<Animation>(
    idle, 
    walk);
}

void draw() {
  background(32);
  stroke(255);
  strokeWeight(1);
  line(0, height / 2.0, width, height / 2.0);
  animator.current.onSustain();
  
  if(keyPressed) {
    if(key == CODED) {
      if(keyCode == RIGHT) {
        animator.set("Walk");
      }
    }
  } else {
    animator.set("Idle");
  }
}