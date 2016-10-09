class Range {
  float lowerBound = 0;
  float upperBound = 1;
  float value = 0.5;

  Range() {
  }

  Range(float a, float b) {
    this.lowerBound = min(a, b);
    this.upperBound = max(a, b);
    this.value = map(this.value, 0, 1, this.lowerBound, this.upperBound);
  }

  Range(float lb, float value, float ub) {
    this.lowerBound = min(lb, ub);
    this.upperBound = max(lb, ub);
    this.value = constrain(value, this.lowerBound, this.upperBound);
  }
  
  void draw() {
  
  }
  
  public String toString() {
    return nfs(this.value, 1, 1);
  }
}