import java.util.*;

class StateMachine<E extends State> {
  public State current;
  public State previous;
  private Map<String, E> states;

  StateMachine(E... n) {
    states = new HashMap<String, E>();
    int size = n.length;
    for (int i = 0; i < size; ++i) {
      this.states.put(n[i].toString(), n[i]);
    }
    if (size > 0) {
      this.set(n[0]);
    }
  }

  public String toString() {
    return this.states.values().toString();
  }

  public Collection<E> get() {
    return this.states.values();
  }

  public E get(String s) {
    return this.states.get(s);
  }

  public void set(String s) {
    this.set(this.states.get(s));
  }

  void set(E s) {
    this.previous = this.current;
    this.current = s;
    this.onExit();
    this.onEnter();
  }

  void onEnter() {
    this.current.onEnter();
  }

  void onSustain() {
    this.current.onSustain();
  }

  void onExit() {
    if (this.previous != null) {
      this.previous.onExit();
    }
  }

  void onMousePressed() {
    this.current.onMousePressed();
  }

  void onKeyReleased() {
    this.current.onKeyReleased();
  }
}