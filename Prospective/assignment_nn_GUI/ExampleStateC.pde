class ExampleStateC extends State {

  TextInput ti;
  Slider redSlider, greenSlider, blueSlider;
  ButtonCircle goBack;

  color c;

  void onEnter() {
    // TextInput(topLeftCornerX, topLeftCornerY, width, height, cornerRounding, label);
    ti = new TextInput(width * 0.5 - 90, height * 0.25, 180, 22, 2, "Enter a String: ");

    // Slider(drawMode, a, b, c, d, cornerRounding);
    redSlider = new Slider(CENTER, width * 0.20, height * 0.75, 150, 12, 2);
    redSlider.range = new Range(0, 255, 255);
    redSlider.label.string = "RED";

    greenSlider = new Slider(CENTER, width * 0.5, height * 0.75, 150, 12, 2);
    greenSlider.range = new Range(0, 255, 255);
    greenSlider.label.string = "GREEN";

    blueSlider = new Slider(CENTER, width * 0.80, height * 0.75, 150, 12, 2);
    blueSlider.range = new Range(0, 255, 255);
    blueSlider.label.string = "BLUE";

    goBack = new ButtonCircle(40, height - 40, 35, "Go Back");
    goBack.leftClickEvent = new GoBackEvent();

    c = color(32);
  }

  void onSustain() {
    c = lerpColor(c, color(redSlider.range.value, greenSlider.range.value, blueSlider.range.value), 0.25);
    background(c);
    
    ti.draw();

    redSlider.draw();
    greenSlider.draw();
    blueSlider.draw();

    goBack.draw();
  }

  void onExit() {
  }

  void mouseReleased() {
    if (mouseButton == LEFT) {
      ti.onLeftClick();
      goBack.onLeftClick();
    }
  }

  void keyPressed() {
    ti.keyPressed();
  }
}