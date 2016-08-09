class Stroke {
  color strokeColor = color(0);
  float weight = 1;
  int cap = ROUND; // SQUARE, PROJECT, ROUND
  int join = MITER; // MITER, BEVEL, ROUND

  Stroke() {
    this.strokeColor = color(0);
    this.weight = 1;
    this.cap = ROUND;
    this.join = MITER;
  }

  Stroke(color strokeColor) {
    this.strokeColor = strokeColor;
    this.weight = 1;
    this.cap = ROUND;
    this.join = MITER;
  }

  Stroke(color strokeColor, float weight) {
    this.strokeColor = strokeColor;
    this.weight = weight;
    this.cap = ROUND;
    this.join = MITER;
  }

  Stroke(color strokeColor, float weight, int cap) {
    this.strokeColor = strokeColor;
    this.weight = weight;
    this.cap = cap;
    this.join = MITER;
  }

  Stroke(color strokeColor, float weight, int cap, int join) {
    this.strokeColor = strokeColor;
    this.weight = weight;
    this.cap = cap;
    this.join = join;
  }

  public String toString() {
    return "STROKE [\r\nstrokeColor: #" + hex(this.strokeColor)
      + ",\r\nweight: " + this.weight
      + ",\r\ncap: " + capToString(this.cap)
      + ",\r\njoin: " + joinToString(this.join)
      + " ]";
  }
}

String capToString(int cap) {
  if (cap == ROUND) {
    return "round";
  } else if (cap == SQUARE) {
    return "square";
  } else if (cap == PROJECT) {
    return "project";
  }
  return "";
}

String joinToString(int join) {
  if (join == MITER) {
    return "miter";
  } else if (join == BEVEL) {
    return "bevel";
  } else if (join == ROUND) {
    return "round";
  }
  return "";
}