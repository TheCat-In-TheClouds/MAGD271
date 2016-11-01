interface Button {
  void draw();
  boolean bounds(float x, float y);
  boolean bounds(PVector v);
  void onLeftClick();
}