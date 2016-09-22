PImage atlas;

// 1. In the source image, each tile is 32 by 32 pixels.
int sourceTileX = 32;
int sourceTileY = 32;

// 2. The dimensions of the tiles will be used to determine
//    the number of rows and columns in the atlas based on
//    the atlas's overall width and height.
int rows = 0;
int cols = 0;

void setup() {
  size(256, 128);
  background(32);
  atlas = loadImage("atlas.png");

  // 3. As you can see from the code below this, manually typing in all
  //    the information to retrieve a set of pixels representing a tile
  //    in a sprite atlas and then placing and scaling its representation
  //    in the sketch is tedious. For the sky background, at least, we can
  //    use for loops to automate the process. For loops have a tripartite
  //    structure that helps you to easily navigate two dimensional space:
  //    for(iterator declaration; condition to check; modification of iterator) 
  for (int x = 0; x < width; x += 32) {
    for (int y = 0; y < height; y += 32) {
      image(atlas.get(7 * sourceTileX, 2 * sourceTileY, sourceTileX, sourceTileY), 
        x, y, 32, 32);
    }
  }

  // Ground
  image(atlas.get(0, 0, sourceTileX, sourceTileY), 
    0, height - 32, 32, 32);
  image(atlas.get(1 * sourceTileX, 0, sourceTileX, sourceTileY), 
    32, height - 32, 32, 32);
  image(atlas.get(1 * sourceTileX, 1 * sourceTileY, sourceTileX, sourceTileY), 
    64, height - 32, 32, 32);
  image(atlas.get(1 * sourceTileX, 1 * sourceTileY, sourceTileX, sourceTileY), 
    96, height - 32, 32, 32);
  image(atlas.get(1 * sourceTileX, 1 * sourceTileY, sourceTileX, sourceTileY), 
    128, height - 32, 32, 32);
  image(atlas.get(1 * sourceTileX, 1 * sourceTileY, sourceTileX, sourceTileY), 
    160, height - 32, 32, 32);
  image(atlas.get(1 * sourceTileX, 0, sourceTileX, sourceTileY), 
    192, height - 32, 32, 32);
  image(atlas.get(2 * sourceTileX, 0, sourceTileX, sourceTileY), 
    224, height - 32, 32, 32);

  // Bump
  image(atlas.get(3 * sourceTileX, 2 * sourceTileY, sourceTileX, sourceTileY), 
    64, height - 64, 32, 32);
  image(atlas.get(4 * sourceTileX, 2 * sourceTileY, sourceTileX, sourceTileY), 
    96, height - 64, 32, 32);
  image(atlas.get(5 * sourceTileX, 2 * sourceTileY, sourceTileX, sourceTileY), 
    128, height - 64, 32, 32);
  image(atlas.get(6 * sourceTileX, 2 * sourceTileY, sourceTileX, sourceTileY), 
    160, height - 64, 32, 32);

  // Palm tree
  image(atlas.get(0, 14 * sourceTileY, sourceTileX, sourceTileY), 
    160, height - 64, 32, 32);
  image(atlas.get(0, 13 * sourceTileY, sourceTileX, sourceTileY), 
    160, height - 96, 32, 32);
  image(atlas.get(1 * sourceTileX, 13 * sourceTileY, sourceTileX, sourceTileY), 
    192, height - 96, 32, 32);
  image(atlas.get(0, 12 * sourceTileY, sourceTileX, sourceTileY), 
    160, height - 128, 32, 32);
  image(atlas.get(1 * sourceTileX, 12 * sourceTileY, sourceTileX, sourceTileY), 
    192, height - 128, 32, 32);

  // Rock
  image(atlas.get(14 * sourceTileX, 5 * sourceTileY, sourceTileX, sourceTileY), 
    32, height - 64, 32, 32);

  // Grass
  image(atlas.get(15 * sourceTileX, 5 * sourceTileY, sourceTileX, sourceTileY), 
    192, height - 64, 32, 32);

  // Cloud
  image(atlas.get(13 * sourceTileX, 0, sourceTileX, sourceTileY), 
    96, 0, 32, 32);
}