import java.util.*;

class StateMachine {
  public State current;
  public State previous;
  private Map<String, State> states;

  StateMachine(State... n) {
    states = new HashMap<String, State>();
    int size = n.length;
    if (size > 0) { 
      for (int i = 0; i < size; ++i) {
        this.states.put(n[i].toString(), n[i]);
      }
      this.set(n[0]);
    } else {
      this.states.put("Title", new Title());
      this.states.put("Playing", new Playing());
      this.set("Title");
    }
  }
  
  public String toString() {
    return this.states.values().toString();
  }

  Collection<State> get() {
    return this.states.values();
  }

  State get(String s) {
    return this.states.get(s);
  }

  void set(String s) {
    this.set(this.states.get(s));
  }

  void set(State s) {
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