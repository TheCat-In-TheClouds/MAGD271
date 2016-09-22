PImage corfu;

// 1. ASPECT RATIOS
//    What medium do you care most about? Typography and print,
//    photography, cinema, broadcast and television, painting?
//    Research aspect ratios which are standard to this medium.
//    https://en.wikipedia.org/wiki/Aspect_ratio_(image)
//    You may also want to research aspect ratios and resolutions
//    of various mobile devices (iPhone, iPad, etc.).

//    1.777 : 1 or 16 : 9
//    1.618 : 1 The golden ratio
//    1.5 : 1 or 3 : 2
//    1.333 : 1 or 4 : 3

void setup() {
  // 3. If you want a sketch to take up the full screen, call this
  //    function instead of using size(w, h);
  // fullScreen();
    
  // 2. An exploration of the aspect ratios listed above.

  // 420 * 1.777 = 746
  // size(746, 420);
  // size(420, 746);

  // 420 * 1.618 = 680
  size(680, 420);
  // size(420, 680);
  
  // 420 * 1.5 = 630
  // size(630, 420);
  // size(420, 630);
  
  // 420 * 1.333 = 560
  // size(560, 420);
  // size(420, 560);
  
  corfu = loadImage("corfu.png");
}

void draw() {
  background(32);
  image(corfu, 0, 0, width, height);
}