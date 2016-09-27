void setup() {
  size(420, 420);
  background(32);
}

void draw() {
  background(32);
  noStroke();

  // 1. ellipseMode governs the interpretation of arcs as well as
  //    ellipses.s
  ellipseMode(CENTER);
  fill(0, 255, 0, 127);
  arc(width * 0.5, height * 0.5, width, height, 0, HALF_PI);

  fill(255, 0, 0, 127);
  arc(width * 0.5, height * 0.5, width * 0.85, height * 0.85, QUARTER_PI, QUARTER_PI * 3);

  // 2. The last piece of information specified by an arc is the
  //    way in which its start and end points are connected. The
  //    default draws a wedge, but CHORD connects just the start
  //    and stop of the arc.
  fill(0, 0, 255, 127);
  arc(width * 0.5, height * 0.5, width * 0.75, height * 0.75, HALF_PI, QUARTER_PI * 7, CHORD);

  fill(255, 255, 0, 127);
  arc(width * 0.5, height * 0.5, width * 0.65, height * 0.65, QUARTER_PI * 6, TAU, CHORD);
}