class SortByHue implements Comparator<Pixel> {
  public int compare(Pixel a, Pixel b) {
    return a.hue.compareTo(b.hue);
  }
}

class SortBySaturation implements Comparator<Pixel> {
  public int compare(Pixel a, Pixel b) {
    return a.saturation.compareTo(b.saturation);
  }
}

class SortByBrightness implements Comparator<Pixel> {
  public int compare(Pixel a, Pixel b) {
    return a.brightness.compareTo(b.brightness);
  }
}

class SortByRed implements Comparator<Pixel> {
  public int compare(Pixel a, Pixel b) {
    return a.red.compareTo(b.red);
  }
}

class SortByGreen implements Comparator<Pixel> {
  public int compare(Pixel a, Pixel b) {
    return a.green.compareTo(b.green);
  }
}

class SortByBlue implements Comparator<Pixel> {
  public int compare(Pixel a, Pixel b) {
    return a.blue.compareTo(b.blue);
  }
}