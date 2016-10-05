class TimeStamp implements Comparable<TimeStamp> {
  int second, minute, hour;

  TimeStamp() {
    this.second = second();
    this.minute = minute();
    this.hour = hour();
  }

  TimeStamp(int hour, int minute, int second) {
    this.second = second;
    this.minute = minute;
    this.hour = hour;
  }

  TimeStamp(int seconds) {
    this.hour = int(seconds / 60.0 / 60.0) % 24;
    this.minute = int(seconds / 60.0) % 60;
    this.second = int(seconds) % 60;
  }

  public String toString() {
    return this.hour + ":"
      + this.minute + ":"
      + this.second + " ("
      + nfc(this.get()) + ")";
  }

  public int compareTo(TimeStamp t) {
    return this.get().compareTo(t.get());
  }

  public int compareTo(int s) {
    return this.get().compareTo(s);
  }

  Integer get() {
    return this.second + (this.minute * 60) + (this.hour * 60 * 60);
  }
}

int convertToSeconds() {
  return second() + (minute() * 60) + (hour() * 60 * 60);
}

int convertToSeconds(int h, int m, int s) {
  return s + (m * 60) + (h * 60 * 60);
}