class KeyListener {
  private Map<Integer, Boolean> pressed;

  KeyListener(Integer... admissibleKeys) {
    pressed = new HashMap<Integer, Boolean>();
    int size = admissibleKeys.length;
    for (int i = 0; i < size; ++i) {
      pressed.put(admissibleKeys[i], false);
    }
  }

  Boolean get(Integer kc) {
    return pressed.get(kc);
  }

  void keyPressed(KeyEvent ke) {
    pressed.put(ke.getKeyCode(), true);
  }

  void keyReleased(KeyEvent ke) {
    pressed.put(ke.getKeyCode(), false);
  }
  
  void keyPressed(Integer kc) {
    pressed.put(kc, true);
  }
  
  void keyReleased(Integer kc) {
    pressed.put(kc, false);
  }
}