class Pixel implements Comparable<Pixel> {
  PVector pos;
  color c;

  Integer red = 0;
  Integer green = 0;
  Integer blue = 0;

  Float hue = 0.0;
  Float saturation = 0.0;
  Float brightness = 0.0;

  Pixel(int x, int y, color c) {
    this.pos = new PVector(x, y);
    this.c = c;

    this.red = this.c >> 16 & 0xFF; // alternative: red(this.c);
    this.green = this.c >> 8 & 0xFF; // alternative: green(this.c);
    this.blue = this.c & 0xFF; // alternative: blue(this.c);

    this.hue = hue(this.c);
    this.saturation = saturation(this.c);
    this.brightness = brightness(this.c);
  }

  public String toString() {
    return this.pos.x + " " + this.pos.y;
  }

  public int compareTo(Pixel p) {
    Float i = this.pos.x + img.width * this.pos.y;
    Float j = p.pos.x + img.width * p.pos.y;
    return i.compareTo(j);
  }

  public void rotateHue(int increment) {
    this.c = color(this.hue = (this.hue + increment) % 360, 
      this.saturation, 
      this.brightness);
  }

  public void cycleSaturation(int increment) {
    this.c = color(this.hue, 
      this.saturation = (this.saturation + increment) % 100, 
      this.brightness);
  }

  public void cycleBrightness(int increment) {
    this.c = color(this.hue, 
      this.saturation, 
      this.brightness = (this.brightness + increment) % 100);
  }

  public void cycleRed(int increment) {
    this.c = color(this.red = (this.red + increment) % 256, 
      this.green, 
      this.blue);
  }

  public void cycleGreen(int increment) {
    this.c = color(this.red,
      this.green = (this.green + increment) % 256,
      this.blue);
  }

  public void cycleBlue(int increment) {
    this.c = color(this.red, 
      this.green, 
      this.blue = (this.blue + increment) % 256);
  }
}