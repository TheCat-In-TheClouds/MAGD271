// 1. Our code already looks like a mess. Let's at least
//    organize our x and y coordinates into pairs using
//    vectors (PVector).
PVector pos1, scale1, origin1, dest1, 
  pos2, scale2, origin2, dest2;

float speed1 = 0.025, speed2 = 0.05;

void setup() {
  size (420, 420);
  background(64);
  noStroke();

  pos1 = new PVector(100, 210);
  scale1 = new PVector(50, 50);
  pos2 = new PVector(210, 210);
  // 2. We could make a new PVector here, but I want the
  //    circles to be the same size, so I'll just assign
  //    a copy of scale1 to scale2. Notice that where you're
  //    used to calling functions that belong to everyone,
  //    certain functions, like copy() belong to a PVector,
  //    and so you have to say that PVector variable's name
  //    followed by dot, then the function call.
  scale2 = scale1.copy();

  // 3. The circles will start at their origin points, so
  //    we can make copies there as well.
  origin1 = pos1.copy();
  origin2 = pos2.copy();

  // 4. Instead of adding a little bit to my x and y variables
  //    each time, I'll just create PVectors that contain the
  //    desired destination.
  dest1 = new PVector(420, 210);
  dest2 = new PVector(210, 0);

  // 5. What if I want to swap two vectors around?
  origin1 = PVector.add(origin1, origin2);
  origin2 = PVector.sub(origin1, origin2);
  origin1 = PVector.sub(origin1, origin2);
  println("origin1 = " + origin1);
  println("origin2 = " + origin2);

  // 6. Swapping vectors method 2:
  PVector temp = dest1.copy();
  dest1 = dest2.copy();
  dest2 = temp.copy();
  println("dest1 = " + dest1);
  println("dest2 = " + dest2);
}

void draw() {
  background(32);

  fill(255, 127, 0);
  ellipse(pos1.x, pos1.y, scale1.x, scale1.y);
  fill(0, 255, 127);
  ellipse(pos2.x, pos2.y, scale2.x, scale2.y);

  // 7. Linear interpolation is a fancy word for 'move
  //    towards'. See https://www.khanacademy.org/partner-content/pixar/animate/parametric-curves/v/animation-5
  //    and https://en.wikipedia.org/wiki/Linear_interpolation
  //    for more information. Changing the speed, changes
  //    how quickly the item reaches its destination.
  pos1.lerp(dest1, speed1);
  pos2.lerp(dest2, speed2);

  // 8. Alternatively, if you had no particular place to be,
  //    you can just send your vectors meandering, by adding
  //    to them.
  //pos2.add(new PVector(1, 0));
  //pos1.add(new PVector(0, -1));

  // 9. Linear interpolation is messy. Floats
  //    are imprecise, and the position of an
  //    ellipse may never quite reach its destination,
  //    being maybe 0.0001 shy of it. So, we
  //    round our position's x and y up to whole
  //    numbers before comparing them with our
  //    destination's coordinates.
  if (round(pos1.x) == round(dest1.x) &&
    round(pos1.y) == round(dest1.y)) {
    PVector temp = dest1.copy();
    dest1 = origin1.copy();
    origin1 = temp.copy();
  }

  if (round(pos2.x) == round(dest2.x) &&
    round(pos2.y) == round(dest2.y)) {
    PVector temp = dest2.copy();
    dest2 = origin2.copy();
    origin2 = temp.copy();
    //speed1 = speed1 * 1.005;
  }
}