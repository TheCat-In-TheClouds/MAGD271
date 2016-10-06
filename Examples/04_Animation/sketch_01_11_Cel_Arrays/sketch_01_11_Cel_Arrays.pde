// 1. We can use an array or list to represent the concept
//    of a sequence of still images.
PImage[] frames = new PImage[6];

// 2. An index to track the current frame will be helpful.
int currentLeft = 0, currentRight = 0;

// 3. Instead of restarting at the first frame after you cycle
//    through the last frame, you may want to oscillate or ping
//    pong back and forth between two poles. A variable to record
//    the direction of that oscillation is needed.
int oscillation = 1;

int scaleX = 2, scaleY = 2;

void setup() {
  size(420, 420);
  background(32);
  frameRate(2);

  // 4A.  Adding frames to an array.
  //      Confusingly, arrays begin counting at 0
  //      and stop counting at array.length -1.
  //      Attempting to access an index outside of
  //      that range will lead to an Array Out of Bounds
  //      Exception.
  frames[0] = loadImage("fr1.png");
  frames[1] = loadImage("fr2.png");
  frames[2] = loadImage("fr3.png");
  frames[3] = loadImage("fr4.png");
  frames[4] = loadImage("fr5.png");
  frames[5] = loadImage("fr6.png");

  // 4B.  If you feel comfortable using a for-loop,
  //      you can use that to load your images.
  //int size = frames.length;
  //for(int i = 0; i < size; ++i) {
  //  frames[i] = loadImage("fr" + (i + 1) + ".png");
  //}
}

void draw() {
  background(32);
  imageMode(CENTER);

  // 5. Accessing frames when using an array.
  //    The left image returns to the first frame
  //    after reaching the last.
  image(frames[currentLeft], 
    width * 0.25, 
    height * 0.5, 
    frames[currentLeft].width * scaleX, 
    frames[currentLeft].height * scaleY);

  currentLeft = ( currentLeft + 1) % frames.length;

  // 6. Accessing frames when using an array.
  //    The current frame bounces back and forth
  //    between the first and last frame.
  image(frames[currentRight], 
    width * 0.75, 
    height * 0.5, 
    frames[currentRight].width * scaleX, 
    frames[currentRight].height * scaleY);

  currentRight = currentRight + 1 * oscillation;
  if(currentRight == 0 || currentRight == frames.length - 1) {
    oscillation = -oscillation;
  }
}