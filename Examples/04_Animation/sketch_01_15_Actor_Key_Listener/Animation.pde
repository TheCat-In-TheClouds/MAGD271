class Animation extends State {

  // 1. This version of the Animation class has a name, so
  //    that it can be recognized by the StateMachine.
  public String name;

  // 2. The previous version of the animation used an array,
  //    which is not as flexible as a list. An array has to
  //    stay at a fixed size while a list can grow in size.
  private List<PImage> frames;
  private int current = 0, 
    oscillation = 1, 
    interval = 20;
  private float w = 64, 
    h = 64, 
    offsetX, 
    offsetY;

  public int pivot = CENTER;

  Animation(String name) {
    this.name = name;
    this.frames = new ArrayList<PImage>();
  }

  Animation(String name, int interval) {
    this.name = name;
    this.interval = interval;
    this.frames = new ArrayList<PImage>();
  }

  Animation(String name, PImage... n) {
    this.name = name;
    this.frames = new ArrayList<PImage>();
    int size = n.length;
    for (int i = 0; i < size; ++i) {
      this.frames.add(n[i]);
    }
  }

  // 3. Previous Animation constructors used a single Sprite
  //    Atlas from which an array of frames was built. This
  //    instead uses individual images provided by the user.
  //    The ... signify the concept of varargs aka params.
  //    All the PImages the user supplies to this constructor
  //    will be treated as an array PImage[] named n.
  Animation(String name, int interval, PImage... n) {
    this.name = name;
    this.interval = interval;
    this.frames = new ArrayList<PImage>();
    int size = n.length;
    for (int i = 0; i < size; ++i) {
      this.frames.add(n[i]);
    }
  }

  public String toString() {
    return this.name;
  }

  // 4. These functions act as wrappers around the list
  //    of PImages.
  public void add(PImage n) {
    this.frames.add(n);
  }

  public PImage remove(int i) {
    return this.frames.remove(i);
  }

  public PImage get(int i) {
    return this.frames.get(i);
  }

  // 5. Since Animation now extends State, so it can be
  //    used by a StateMachine, it now has to conform with
  //    State's expectations of how functions will be used.
  //    This means Animation must implement three functions
  //    and use onSustain() as its draw() function.
  void onEnter() {
  }

  void onSustain() {
    advance();
    pushStyle();
    imageMode(this.pivot);
    image(this.frames.get(current), this.offsetX, this.offsetY, this.w, this.h);
    popStyle();
  }
  
  // 6. When the character is actually moving around the screen,
  //    the animation must be modified to accomodate this.
  void onSustain(float x, float y, float w, float h) {
    advance();
    pushStyle();
    imageMode(this.pivot);
    image(this.frames.get(current), x, y, w, h);
    popStyle();
  }

  void onExit() {
  }

  private void advance() {
    if (frameCount % this.interval == 0) {
      this.current += 1 * this.oscillation;
      if (this.current == this.frames.size() - 1 ||
        this.current == 0) {
        this.oscillation *= -1;
      }
    }
  }
}