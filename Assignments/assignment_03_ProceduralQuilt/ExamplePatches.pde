class ExamplePatchA extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(mouseX - pmouseX, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(y, 0, height, 127, 255));
    rect(x, y, w, h);
    ellipseMode(RADIUS);
    fill(20, random(100, 120), 166);
    arc(x + w, y + h, w, h, PI, PI + HALF_PI);
    fill(random(200, 240), 221, 26);
    arc(x + w, y + h, w * 3 / 4, h * 3 /4, PI, PI + HALF_PI);
    fill(random(180, 217), 4, 4);
    arc(x + w, y + h, w / 2, h / 2, PI, PI + HALF_PI);
    fill(10, map(y, 0, height, 45, 90), random(100, 140));
    arc(x + w, y + h, w / 4, h / 4, PI, PI + HALF_PI);
    popStyle();
  }
}

class ExamplePatchB extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseY - pmouseY, 0, height, 127, 255));
    rect(x, y, w, h);
    ellipseMode(RADIUS);
    fill(20, random(100, 120), 166);
    arc(x, y, w, h, 0, HALF_PI);
    fill(random(200, 240), 221, 26);
    arc(x, y, w * 3 / 4, h * 3 /4, 0, HALF_PI);
    fill(random(180, 217), 4, 4);
    arc(x, y, w / 2, h / 2, 0, HALF_PI);
    fill(10, map(x, 0, height, 45, 90), random(100, 140));
    arc(x, y, w / 4, h / 4, 0, HALF_PI);
    popStyle();
  }
}

class ExamplePatchC extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(mouseY - pmouseY, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(y, 0, height, 127, 255));
    rect(x, y, w, h);
    ellipseMode(RADIUS);
    fill(20, random(100, 120), 166);
    arc(x + w, y, w, h, HALF_PI, PI);
    fill(random(200, 240), 221, 26);
    arc(x + w, y, w * 3 / 4, h * 3 /4, HALF_PI, PI);
    fill(random(180, 217), 4, 4);
    arc(x + w, y, w / 2, h / 2, HALF_PI, PI);
    fill(10, map(mouseY, 0, height, 45, 90), random(100, 140));
    arc(x + w, y, w / 4, h / 4, HALF_PI, PI);
    popStyle();
  }
}

class ExamplePatchD extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseX - pmouseX, 0, height, 127, 255));
    rect(x, y, w, h);
    ellipseMode(RADIUS);
    fill(20, random(100, 120), 166);
    arc(x, y + h, w, h, PI + HALF_PI, TAU);
    fill(random(200, 240), 221, 26);
    arc(x, y + h, w * 3 / 4, h * 3 /4, PI + HALF_PI, TAU);
    fill(random(180, 217), 4, 4);
    arc(x, y + h, w / 2, h / 2, PI + HALF_PI, TAU);
    fill(10, map(mouseX, 0, height, 45, 90), random(100, 140));
    arc(x, y + h, w / 4, h / 4, PI + HALF_PI, TAU);
    popStyle();
  }
}

class ExamplePatchE extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseX - pmouseX, 0, height, 127, 255));
    rect(x, y, w, h);
    popStyle();
    
    pushStyle();
    noFill();
    strokeCap(SQUARE);
    strokeWeight(w * 0.375);
    stroke(20, random(100, 120), 166);
    arc(x + w, y + h, w, h, PI, PI + HALF_PI);
    stroke(random(200, 240), 221, 26);
    arc(x + w, y + h, w * 3 / 4, h * 3 /4, PI, PI + HALF_PI);
    stroke(random(180, 217), 4, 4);
    arc(x + w, y + h, w / 2, h / 2, PI, PI + HALF_PI);
    stroke(10, map(y, 0, height, 45, 90), random(100, 140));
    arc(x + w, y + h, w / 4, h / 4, PI, PI + HALF_PI);
    
    //stroke(20, random(100, 120), 166);
    stroke(random(180, 217), 4, 4);
    arc(x, y, w, h, 0, HALF_PI);
    stroke(random(200, 240), 221, 26);
    arc(x, y, w * 3 / 4, h * 3 /4, 0, HALF_PI);
    //stroke(random(180, 217), 4, 4);
    stroke(20, random(100, 120), 166);
    arc(x, y, w / 2, h / 2, 0, HALF_PI);
    stroke(10, map(x, 0, height, 45, 90), random(100, 140));
    arc(x, y, w / 4, h / 4, 0, HALF_PI);
    popStyle();
  }
}

class ExamplePatchF extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseX - pmouseX, 0, height, 127, 255));
    rect(x, y, w, h);
    popStyle();

    pushStyle();
    noFill();
    strokeCap(SQUARE);
    strokeWeight(w * 0.375);
    stroke(20, random(100, 120), 166);
    arc(x + w, y, w, h, HALF_PI, PI);
    stroke(random(200, 240), 221, 26);
    arc(x + w, y, w * 3 / 4, h * 3 /4, HALF_PI, PI);
    stroke(random(180, 217), 4, 4);
    arc(x + w, y, w / 2, h / 2, HALF_PI, PI);
    stroke(10, map(mouseY, 0, height, 45, 90), random(100, 140));
    arc(x + w, y, w / 4, h / 4, HALF_PI, PI);
    
    stroke(20, random(100, 120), 166);
    arc(x, y + h, w, h, PI + HALF_PI, TAU);
    stroke(random(200, 240), 221, 26);
    arc(x, y + h, w * 3 / 4, h * 3 /4, PI + HALF_PI, TAU);
    stroke(random(180, 217), 4, 4);
    arc(x, y + h, w / 2, h / 2, PI + HALF_PI, TAU);
    stroke(10, map(mouseX, 0, height, 45, 90), random(100, 140));
    arc(x, y + h, w / 4, h / 4, PI + HALF_PI, TAU);

    popStyle();
  }
}

class ExamplePatchK extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseY, 0, height, 127, 255));
    rect(x, y, w, h);
    fill(20, random(100, 120), 166);
    ellipse(x + w / 2.0, y + h / 2.0, w, h);
    fill(random(200, 240), 221, 26);
    ellipse(x + w / 2.0, y + h / 2.0, w * 0.75, h * 0.75);
    fill(random(180, 217), 4, 4);
    ellipse(x + w / 2.0, y + h / 2.0, w / 2.0, h / 2.0);
    fill(10, 90, random(100, 140));
    ellipse(x + w / 2.0, y + h / 2.0, w / 4.0, h / 4.0);
    popStyle();
  }
}

class ExamplePatchL extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(map(x, 0, width, 0, 255), map(w * h, 0, width * height, 0, 255), map(mouseY, 0, height, 127, 255));
    rect(x, y, w, h);
    fill(20, random(100, 120), 166);
    quad(x + w, y + h / 2.0, x + w / 2.0, y + h, x, y + h / 2.0, x + w / 2.0, y);
    fill(random(200, 240), 221, 26);
    quad(x + (w * 0.875), y + h / 2.0, x + w / 2.0, y + h * 0.875, x + w * 0.125, y + h / 2.0, x + w / 2.0, y + h * 0.125);
    fill(random(180, 217), 4, 4);
    quad(x + (w * 0.75), y + h / 2.0, x + w / 2.0, y + h * 0.75, x + w * 0.25, y + h / 2.0, x + w / 2.0, y + h * 0.25);
    fill(10, 90, random(100, 140));
    quad(x + (w * 0.625), y + h / 2.0, x + w / 2.0, y + h * 0.625, x + w * 0.375, y + h / 2.0, x + w / 2.0, y + h * 0.375);
    popStyle();
  }
}

class ExamplePatchM extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(20, random(100, 120), 166);
    rect(x, y, w, h);
    fill(random(200, 240), 221, 26);
    rect(x + w * 0.125, y + h * 0.125, w * 0.75, h * 0.75);
    fill(random(180, 217), 4, 4);
    rect(x + w * 0.25, y + h * 0.25, w * 0.5, h * 0.5);
    fill(10, 90, random(100, 140));
    rect(x + w * 0.375, y + h * 0.375, w * 0.25, h * 0.25);
    popStyle();
  }
}

class ExamplePatchN extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(20, random(100, 120), 166);
    rect(x, y, w, h);
    fill(random(200, 240), 221, 26);
    rect(x, y, w * 0.75, h * 0.75);
    fill(random(180, 217), 4, 4);
    rect(x, y, w * 0.5, h * 0.5);
    fill(10, 90, random(100, 140));
    rect(x, y, w * 0.25, h * 0.25);
    popStyle();
  }
}

class ExamplePatchO extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(20, random(100, 120), 166);
    rect(x, y, w, h);
    fill(random(200, 240), 221, 26);
    rect(x + w * 0.25, y + h * 0.25, w * 0.75, h * 0.75);
    fill(random(180, 217), 4, 4);
    rect(x + w * 0.5, y + h * 0.5, w * 0.5, h * 0.5);
    fill(10, 90, random(100, 140));
    rect(x + w * 0.75, y + h * 0.75, w * 0.25, h * 0.25);
    popStyle();
  }
}

class ExamplePatchQ extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(20, random(100, 120), 166);
    rect(x, y, w, h);
    fill(random(200, 240), 221, 26);
    rect(x, y + h * 0.25, w * 0.75, h * 0.75);
    fill(random(180, 217), 4, 4);
    rect(x, y + h * 0.5, w * 0.5, h * 0.5);
    fill(10, 90, random(100, 140));
    rect(x, y + h * 0.75, w * 0.25, h * 0.25);
    popStyle();
  }
}

class ExamplePatchR extends Patch {

  void draw(float x, float y, float w, float h) {
    pushStyle();
    noStroke();
    fill(20, random(100, 120), 166);
    rect(x, y, w, h);
    fill(random(200, 240), 221, 26);
    rect(x + w * 0.25, y, w * 0.75, h * 0.75);
    fill(random(180, 217), 4, 4);
    rect(x + w * 0.5, y, w * 0.5, h * 0.5);
    fill(10, 90, random(100, 140));
    rect(x + w * 0.75, y, w * 0.25, h * 0.25);
    popStyle();
  }
}