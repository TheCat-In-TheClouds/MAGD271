// 1. The larger point here is to decide when you want to
//    treat the components of a color (R, G, B / H, S, B) or of
//    a position (X, Y, Z) as one group and when to work with
//    them separately, increasing just x or just G.

// 1. The same concept of linear interpolation can be
//    applied to colors.

color current;
color origin;
color destin;
color target;

float fadeTime = 0.025;

float r = 27, g = 54, b = 127;
int rdir = 1, gdir = 1, bdir = -1;

void setup() {
  size(680, 420);
  background(64);
  noStroke();

  origin = color(255, 0, 0);
  destin = color(255, 255, 0);
  target = destin;
  current = origin;
}

void draw() {
  background(32);
  
  current = lerpColor(current, target, fadeTime);
  println(hex(current));
  target = color(0, 
    map(mouseX, 0, width, 0, 255), 
    map(mouseY, 0, height, 0, 255));

  if (r >= 255 || r <= 0) { 
    rdir *= -1;
  }
  r = r + (1 * rdir);

  if (g >= 255 || g <= 0) { 
    gdir *= -1;
  }
  g = g + (1 * gdir);

  if (b >= 255 || b <= 0) { 
    bdir *= -1;
  }
  b = b + (1 * bdir);

  fill(current);
  ellipse(340, 210, 300, 300);
  fill(r, g, b, 220);
  ellipse(340, 210, 200, 200);
  fill(b, r, g, 210);
  ellipse(340, 210, 150, 150);
    fill(g, b, r, 200);
  ellipse(340, 210, 100, 100);
}