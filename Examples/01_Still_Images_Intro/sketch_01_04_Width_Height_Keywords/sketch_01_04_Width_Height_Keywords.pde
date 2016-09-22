PImage corfu;

void setup() {
  size(420, 420);
  corfu = loadImage("corfu.png");
  
  // 1. Write PImage corfu's width to the console with println(String message); 
  println("Source image width: " + corfu.width);
  // 2. Write PImage corfu's width to the console with println(String message); 
  println("Source image height: " + corfu.height);
}

void draw() {
  background(32);
  
  // 3. You can use the width and height keywords to stand in for hand-calculated
  //    values. Here, the image is given a margin.
  imageMode(CORNERS);
  image(corfu, 20, 20, width - 20, height - 20);
  
  // 4. Why do these two lines below produce the same result as the two above?
  // imageMode(CORNER);
  // image(corfu, 20, 20, width - 40, height - 40);
  
  // 5. With these two sets of key words, you can now explore how to scale
  //    your image. In this case, the center of the sketch is found by
  //    dividing its width and height in half. The image is scaled to 1/5th
  //    of its original size.
  imageMode(CENTER);
  image(corfu, width / 2.0, height / 2.0, corfu.width / 5.0, corfu.height / 5.0);
  
  // 6. If the Rule of Thirds is important to you, you can multiply these
  //    keywords by 1/3rd and 2/3rds to quickly find the key boundarylines.
  image(corfu, width / 3.0, height / 4.0, 100, 100);
  image(corfu, width * 2 / 3.0, height * 3 / 4.0, 100, 100);
}