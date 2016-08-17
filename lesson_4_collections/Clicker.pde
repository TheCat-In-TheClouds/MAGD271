class Clicker {
  List<Widget> widgets = new ArrayList<Widget>();
  List<Widget> retired = new ArrayList<Widget>();

  void addWidget(int diameter) {
    Widget widget = new Widget(diameter);
    widgets.add(widget);
  }

  void drawWidgets(int x, int y, int diameter) {
    int size = retired.size();
    for(int i = 0; i < size; ++i) {
      retired.get(i).display(0,0);
    }
    
    size = widgets.size();
    for (int i = 0; i < size; ++i) {
      widgets.get(i).display((int)(x + random(-diameter * i / 2, diameter * i / 2)), (int)(y + random(-diameter * i / 2, diameter * i / 2)));
    }
  }

  void removeWidget() {
    int size = widgets.size();
    if (size > 0) {
      widgets.remove(size - 1);
    } else {
      size = retired.size();
      if(size > 0) {
        retired.remove(size - 1);
      }
    }
  }
  
  void retireWidget() {
    int size = widgets.size();
    if(size > 0) {
      Widget removed = widgets.get(size -1);
      removed.retire(mouseX, mouseY);
      widgets.remove(size - 1);
      this.retired.add(removed);
    }
  }
  
  void showInstructions() {
    fill(255);
    text("Number of active widgets: " + widgets.size()
    + "\r\nNumber of retired widgets: " + retired.size()
    + "\r\n\r\nLeft click to add a widget."
    + "\r\nRight click to remove a widget."
    + "\r\nMiddle click to retire a widget.", 15, 15);
    
  }
}