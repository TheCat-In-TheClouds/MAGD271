abstract class Patch {
  float w, h;
  float x, y;
  
  Patch() {
    this.w = width / 10;
    this.h = height / 10;
  }
  
  public abstract void draw(float x, float y, float w, float h);
}