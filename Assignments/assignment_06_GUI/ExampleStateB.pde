class ExampleStateB extends State {

  DraggableRect r;
  DraggableCircle c;

  Rect basketForRect;
  Ellipse basketForCircle;

  ButtonCircle goBack;

  void onEnter() {

    // DraggableRect(centerX, centerY, width, height, cornerRounding);
    r = new DraggableRect(width * 0.75, height * 0.25, 80, 80, 5);
    // DraggableCircle(centerX, centerY, radius);
    c = new DraggableCircle(width * 0.75, height * 0.5, 40);

    basketForRect = new Rect(width * 0.25 - 50, height * 0.75 - 50, 100, 100, 3);
    basketForCircle = new Ellipse(width * 0.25, height * 0.25, 100, 100);
    basketForRect.fillColor = basketForCircle.fillColor = color(255, 14); 
    basketForRect.strokeColor = basketForCircle.strokeColor = color(255);

    goBack = new ButtonCircle(40, height - 40, 35, "Go Back");
    goBack.leftClickEvent = new GoBackEvent();
    goBack.enabled = false;
  }

  void onSustain() {
    background(32);

    basketForRect.draw();
    basketForCircle.draw();

    r.draw();
    c.draw();

    goBack.draw();

    if (r.isInside(basketForRect)) {
      noStroke();
      fill(0, 255, 0);
      ellipse(width - 30, height - 30, 15, 15);
    }

    if (c.isInside(basketForCircle)) {
      noStroke();
      fill(0, 255, 0);
      ellipse(width - 30, height - 90, 15, 15);
    }

    goBack.enabled = r.isInside(basketForRect) && c.isInside(basketForCircle);
  }

  void onExit() {
  }

  void mouseReleased() {
    if (mouseButton == LEFT) {
      goBack.onLeftClick();
    }
  }

  void keyPressed() {
  }
}