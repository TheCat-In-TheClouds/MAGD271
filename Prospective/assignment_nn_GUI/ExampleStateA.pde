class ExampleStateA extends State {

  ButtonRect toDraggables;
  ButtonRect toTextInput;

  void onEnter() {
    // ButtonRect(topLeftCornerX, topLeftCornerY, width, height, cornerRounding, label);
    toDraggables = new ButtonRect(width * 0.5 - 90, height * 0.25 - 16, 180, 32, 5, "Go to Draggables");
    toTextInput = new ButtonRect(width * 0.5 - 90, height * 0.5 - 16, 180, 32, 5, "Go to Text Input");
    
    // Since I don't know in advance what you would like to
    // happen when you click on a button, you have to define
    // it as an event and then assign that event to the button.
    toDraggables.leftClickEvent = new ExampleEventA();
    toTextInput.leftClickEvent = new ExampleEventB();
  }

  void onSustain() {
    background(32);
    toDraggables.draw();
    toTextInput.draw();
  }

  void onExit() {
  }

  void mouseReleased() {
    if (mouseButton == LEFT) {
      toDraggables.onLeftClick();
      toTextInput.onLeftClick();
    }
  }
  
  void keyPressed() {
  }
}