// When you think of a shape, you may intuitively believe it to be an object,
// that is, a stable entity which has qualities, about which calculations can
// be made, and to which behaviors can be assigned. However, Processing
// does not think of objects that way. As often as not, shapes are methods
// or behaviors which are repeatedly called in the update loop. Perhaps this
// is an advantage in that a triangle can morph into a circle can become a square.
// However, Processing's way is not common to other creative coding environments.
// It's up to us to think about how to wrap Processing's methods in OOP classes
// so as to behave like Adobe Flash ActionScript objects or Unity GameObjects.

Point point;
Line line;
Ellipse ellipse;
Rect rect;
Triangle triangle;

void setup() {
  size(500, 500);
  background(255);
  smooth();

  // A disadvantage of the Object-Oriented approach, however, is the
  // potentially large, complex processing of constructing an object.
  // Because a shape has potential to store lots of qualities about
  // color, stroke width, pivot/registraion point, etc. many constructors
  // need definition; examples below show some worst case scenarios.

  point = new Point(
    new PVector(100, height/2f),          // Position (x, y)
    new Stroke(color(255, 0, 255), 10)    // Stroke (color, weight)
    );

  line = new Line(
    new PVector(width/5f, height/5f),        // Origin pos (x, y)
    new PVector(width*4f/5f, height*4f/5f),  // Destination position (x, y)
    new Stroke(color(127), 10, SQUARE)       // Stroke (color, weight, cap)
    );

  ellipse = new Ellipse(
      new Transform2D(
        new PVector(375, 75),    // Center (x, y)
        new PVector(25, 50),     // Scale (w, h)
        45f                      // Rotation (in degrees)
      ), 
      new Renderer2D(
        color(255, 0, 0),        // Fill color
        new Stroke(
          color(255, 255, 0),    // Stroke color
          3f                     // Stroke weight
        )
      ), 
      CENTER                     // Pivot or registration point of the ellipse.
    );
    
    rect = new Rect(
      new Transform2D(
        new PVector(100, 375),   // Position (x, y)
        new PVector(75, 50),     // Scale (w, h)
        60f                      // Rotation (in degrees)
      ), 
      new Renderer2D(
        color(0, 127, 255),      // Fill color
        new Stroke(
          color(0, 255, 127),    // Stroke color
          5f                     // Stroke weight
        )
      ),
      new Corners(
        0.75f                    // Rounding for corners
      ),
      CENTER                     // Pivot or registration point of the ellipse.
    );
    
    triangle = new Triangle(
      new PVector(10,5),
      new PVector(120,70),
      new PVector(80,180),
      new Renderer2D(            // Constructing a Renderer2D with only a stroke
        new Stroke()             // specified is equivalent to noFill()
      )
    );
    
    println(point);
    println(line);
    println(ellipse);
    println(rect);
    println(triangle);
}

void draw() {
  background(255);
  point.update();
  line.update();
  ellipse.update();
  rect.update();
  triangle.update();
 
  triangle.translate(1,0.5);
  rect.transform.rotate(1);
  ellipse.transform.scale(1.005f);
}

float dist(PVector v1, PVector v2) {
  return dist(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
}