Quilt q;
int patchCount = 16;

void setup() {
  fullScreen();
  // size(420, 420);
  background(32);
  frameRate(1);

  // 2. You can initialize the quilt object here. Change
  //    tileCount to see how many tiles are spread out
  //    on the quilt.
  q = new Quilt(patchCount);

  // 3. The quilt will attempt to maintain the 1:1 aspect
  //    of the tiles that you create, unless you set the
  //    boolean variable below to false.
  // q.maintainAspect = false;

  // 4. The quilt will default to tiling patterns by the
  //    shorter edge of the screen. So, a tileCount of 3
  //    would create 3 columns in a landscape view, with
  //    the last column running off the side of the screen.
  //    This doesn't matter if you're not maintaining
  //    aspect, but are stretching the tiles. Switch to
  //    Axis.Major to change the above behavior.
  // q.axis = Axis.MAJOR;

  // 5. After you've created a pattern, you can add it
  //    to the quilt using the quilt's addPattern(Pattern)
  //    function.
  q.addPatch(new ExamplePatchB());
  q.addPatch(new ExamplePatchC());
  q.addPatch(new ExamplePatchN());
  // q.addPatch(new ExamplePatchN(loadImage("corfu.png")));

  // 6. If you want the quilt to draw just once, you can
  //    comment out the void draw() { q.draw(); } below
  //    and use this line below:
  // q.draw();
}

// 7. Calling q.draw() here will cause it to update every
//    n frames, where n is the number in the frameRate(n);
//    function above.
void draw() {
  q.draw();
}

// 8. You can take a screenshot of your quilt by clicking the
//    right mouse button with the code below. NOTE: This
//    requires the draw function above to be uncommented.
void mousePressed() {
  if (mouseButton == RIGHT) {
    save(millis() + ".png");
    println("Saved image to the sketch folder.");
  }
}