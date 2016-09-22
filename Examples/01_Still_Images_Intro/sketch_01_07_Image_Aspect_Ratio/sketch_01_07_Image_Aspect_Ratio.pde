PImage corfu;

void setup() {
  size(680, 420);
  corfu = loadImage("corfu.png"); 
}

void draw() {
  background(0);
  
  // 1. imageVariableName.resize(w, h);
  //    where w and h are the desired width and height of the image.
  //    Whenever 0 is supplied as an argument, that dimension will
  //    scale in proportion, maintaining the image's native aspect ratio.
  //    Thus, you can combine imageMode(CENTER); with the width and
  //    height keywords to fit your image to the canvas.
  imageMode(CENTER);
  corfu.resize(width, 0);
  // corfu.resize(0, height);
  image(corfu, width / 2.0, height / 2.0, corfu.width, corfu.height);
  
  // 2. The problem with using this function is that you should not
  //    call it multiple times in draw. Uncomment it and see.
  //    Why do you think this result happens?
  //    Where would you put your image.resize() call, in setup() or draw(),
  //    or elsewhere?
  // corfu.resize(width / 2, 0);
  // image(corfu, width * 2 / 3.0, height * 2 / 3.0, corfu.width, corfu.height);
  
  // 3. The keywords mouseX and mouseY provide the mouse's coordinates
  //    relative to the top-left corner of the sketch, the origin, (0, 0).
  //    With this, you can make your own custom cursor. For example,
  //    noCursor();
  //    imageMode(CENTER);
  //    image(img, mouseX, mouseY, w, h);
  imageMode(CORNER);
  image(corfu, 0, 0, mouseX, mouseY);
  
  
  // 4. map(float value, float originLowerBound, float originUpperBound,
  //                     float targetLowerBound, float targetUpperBound);
  // Map takes a value from one range and returns a corresponding value
  // in a different range. If we want an image to be rescaled in response
  // to user input while maintaining its aspect ratio, we can use the map
  // function to make sure height keeps pace with width or vice versa.
  image(corfu, 0, 0, mouseX, map(mouseX, 0, width,
                                         0, corfu.height));
  // image(corfu, 0, 0, map(mouseY, 0, height,
  //                                0, corfu.width), mouseY);
}