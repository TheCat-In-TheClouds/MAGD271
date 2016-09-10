 // 16:9 or 1.777:1 aspect ratio
size(746, 420);
background(255);
textAlign(BOTTOM, LEFT);
fill(255, 0, 0);

// VERTICAL DIVISIONS
// Left third == xPosition < width / 3.0
line(width / 3.0, 0, width / 3.0, height);
// Right third == xPosition > width * 2 / 3.0
line(width * 2 / 3.0, 0, width * 2 / 3.0, height);
// Middle third == xPosition > width / 3.0 && xPosition < width * 2 / 3.0

// HORIZONTAL DIVISIONS
// Top third == yPosition < height / 3.0
line(0, height / 3.0, width, height / 3.0);
// Bottom third == yPosition > height * 2 / 3.0
line(0, height * 2 / 3.0, width, height * 2 / 3.0);
// Middle third == yPosition > height / 3.0 && yPosition < height * 2 / 3.0

// INTERSECTIONS
stroke(255, 0, 0);
strokeWeight(7);

// Top-Left
point(width / 3.0, height / 3.0);
text("(" + width / 3 + ", " + height / 3  + ")", width / 3.0 + 5, height / 3.0 - 5);

// Top-Right
point(width * 2 / 3.0, height / 3.0);
text("(" + width * 2 / 3 + ", " + height / 3  + ")", width * 2 / 3.0 + 5, height / 3.0 - 5);

// Bottom-Right
point(width * 2 / 3.0, height * 2 / 3.0);
text("(" + width * 2 / 3 + ", " + height * 2 / 3  + ")", width * 2 / 3.0 + 5, height * 2 / 3.0 - 5);

// Bottom-Left
point(width / 3.0, height * 2 / 3.0);
text("(" + width / 3 + ", " + height * 2 / 3  + ")", width / 3.0 + 5, height * 2 / 3.0 - 5);