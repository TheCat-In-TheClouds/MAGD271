class Animation {
  // 1. What is an animation but a series of frames which are cycled through
  //    in a particular order? I'm representing these internally as an array
  //    of PImages. This is done by adding [] to the end of the data type.
  PImage[] frames;
  int row = 0;
  int col = 0;
  int currentFrame = 0;
  int oscillation = 1;
  int registration = CENTER;

  // 2. To build an instance or object from the class - the blueprint - we need
  //    constructors. Some constructors require information to build the object.
  //    Note that you can have multiple constructors, so long as their signatures
  //    - the lists of information they require - are different.
  Animation(PImage source, int noFrames) {
    // 3. An array is a new allocation of memory; the computer needs to know
    //    how much to allocate, so initializing the frames array means assigning
    //    it new dataType[sizeOfTheArray];
    this.frames = new PImage[noFrames];
    setFrames(source, 32, 32);
  }

  Animation(PImage source, int sourceTileW, int sourceTileH, 
    int noFrames) {
    this.frames = new PImage[noFrames];
    setFrames(source, sourceTileW, sourceTileH);
  }

  Animation(PImage source, int sourceTileW, int sourceTileH, 
    int noFrames, int startRow, int startCol) {
    this.frames = new PImage[noFrames];
    this.row = startRow;
    this.col = startCol;
    setFrames(source, sourceTileW, sourceTileH);
  }

  // 4. This assumes that frames of animation will be arranged in rows
  //    in the source sprite atlas.
  void setFrames(PImage source, int tileWidth, int tileHeight) {
    // 5. An array is itself an object, which has fields that can be accessed
    //    by adding the '.' to the end of the array variable name, and then
    //    typing the field name. Here the array's length is retrieved once,
    //    so the for-loop which follows doesn't try to access an index that
    //    is greater than length - 1. Go to preferences and turn on code
    //    completion if you haven't already.
    int size = frames.length;
    // 6. An array counts its elements beginning at 0 and ending at length - 1.
    //    So a for-loop creates an index which equals 0; keeps going until that
    //    index is greater than or equal to length; and increases by one every
    //    run through the loop.
    for (int i = 0; i < size; ++i) {
      // 7. Each element in the frames array is assigned a value from the source
      //    image. Since the tile's width and height are 32 pixels, this code
      //    will grab 32 pixels then move over to the right 32 pixels.
      frames[i] = source.get((this.col + i) * tileWidth, 
        this.row * tileHeight, 
        tileWidth, 
        tileHeight);
    }
  }

  void advanceFrame() {
    currentFrame += 1 * oscillation;
    if (currentFrame == frames.length - 1 || currentFrame == this.row) {
      oscillation *= -1;
    }
  }

  void advanceFrame(float r) {
    if (frameCount % ceil(frameRate / r) == 0) {
      currentFrame += 1 * oscillation;
      if (currentFrame == frames.length - 1 || currentFrame == this.row) {
        oscillation *= -1;
      }
    }
  }

  // 8. This function is basically a wrapper. It advances the frame and
  //    then calls image(), ensuring first that image mode is center.
  void show(float x, float y, float w, float h) {
    advanceFrame();
    pushStyle();
    imageMode(registration);
    image(this.frames[currentFrame], x, y, w, h);
    popStyle();
  }

  void show(float x, float y, float w, float h, float animFrameRate) {
    advanceFrame(animFrameRate);
    pushStyle();
    imageMode(registration);
    image(this.frames[currentFrame], x, y, w, h);
    popStyle();
  }
}