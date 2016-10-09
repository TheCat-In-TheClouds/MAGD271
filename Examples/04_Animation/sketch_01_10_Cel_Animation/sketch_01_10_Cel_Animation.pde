PImage batFly;
PImage heroWalk;
PImage flowerBob;

// 1. If you look at the image files included in this sketch,
//    you'll see that they were constructed as strips of 32 x 32
//    tiles. Since these are arranged horizontally for simplicity,
//    the sourceScaleX variable is more important here.
int sourceScaleX = 32;
int sourceScaleY = 32;

// 2. We need to determine how many frames are available from the
//    source image in order to properly loop through them. This can
//    easily be done by taking the image's total width and divide
//    them by the scale of each tile above.
int batFrameCount;
int heroFrameCount;
int flowerFrameCount;

// 3. These variables will keep track of which frame we are currently
//    displaying.
int batFrame;
int heroFrame;
int flowerFrame;

// 4. For some animations, we may want to return to the first frame
//    after we reach the last. However, for others, like walk cycles
//    it is better to reach the last frame and then ping pong, heading
//    back to the first frame in the other direction. This can be
//    easily achieved by multiplying the frame increment by an oscillator
//    and then multiplying the oscillator by -1 when it's time to
//    change direction.
int batOscillation = 1;
int heroOscillation = 1;
int flowerOscillation = 1;

void setup() {
  size(680, 420);
  background(64);
  batFly = loadImage("batFly.png");
  heroWalk = loadImage("heroWalk.png");
  flowerBob = loadImage("flowerBob.png");

  // 2. This is where we divide width by tile scale to get the
  //    number of frames available in the image.
  batFrameCount = batFly.width / sourceScaleX;
  heroFrameCount = heroWalk. width / sourceScaleX;
  flowerFrameCount = flowerBob.width / sourceScaleX;
  println("bat frame count: " + batFrameCount);
  println("hero frame count: " + heroFrameCount);
  println("flower frame count: " + flowerFrameCount);

  // 5. If your animations are targeted toward a certain frame rate,
  //    you can change it in Processing with this.
  frameRate(12);
}

void draw() {
  imageMode(CENTER);

  // 6. When testing frame by frame animation, instead of either having
  //    a background in draw or not, I find it useful to include a translucent
  //    rectangle the size of the sketch which can act like an onion-skin,
  //    making it easier to debug the animation and see the silhouette of the
  //    character as they move.
  // background(32);
  fill(32, 32, 32, 127);
  rect(0, 0, width, height);

  // 5. If you ever want to know the frame rate you're running at, you
  //    can print it below in the draw call. Default is 60.
  // println(frameRate);

  // 6. Since each frame is 32 pixels wide, the next frame is not 1 but 32 pixels
  //    to the right in the source image. And we want to grab a 32 x 32 square
  //    of pixels to get all the ones in the frame.
  image(heroWalk.get(heroFrame * sourceScaleX, 0, sourceScaleX, sourceScaleY), 
    width / 2.0, height / 2.0, sourceScaleX * 2.5, sourceScaleY * 2.5);

  // 4. This is where we advance the current frame of the walk cycle. The sign of
  //    the oscillation is changed if we reach the first or last frame.
  heroFrame += 1 * heroOscillation;
  if (heroFrame >= heroFrameCount - 1 || heroFrame <= 0) {
    heroOscillation *= -1;
  }

  image(flowerBob.get(flowerFrame * sourceScaleX, 0, sourceScaleX, sourceScaleY), 
    width / 3.0, height / 2.0, sourceScaleX * 2, sourceScaleY * 2);

  flowerFrame += 1 * flowerOscillation;
  if (flowerFrame >= flowerFrameCount - 1 || flowerFrame <= 0) {
    flowerOscillation *= -1;
  }

  image(batFly.get(batFrame * sourceScaleX, 0, sourceScaleX, sourceScaleY), 
    width * 2 / 3.0, height / 2.0, sourceScaleX * 1.5, sourceScaleY * 1.5);

  batFrame += 1 * batOscillation;
  if (batFrame >= batFrameCount - 1 || batFrame <= 0) {
    batOscillation *= -1;
  }
}