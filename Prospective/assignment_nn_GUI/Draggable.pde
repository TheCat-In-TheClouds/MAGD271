static boolean IS_DRAGGING = false;

interface Draggable {
  void draw();
  boolean bounds(float x, float y);
  boolean bounds(PVector v);  
}