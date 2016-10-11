class Card implements Comparable<Card> {
  public String name;
  public Suit suit;
  public Rank rank;
  public Face facing;
  public float cornerRounding = 7.5, screenScale = 0.8;
  public PVector pos, scale;

  // CONSTRUCTORS
  // Multiple constructors are here to give you options when
  // creating a new card. 

  Card() {
    Rank[] ranks = Rank.values();
    Suit[] suits = Suit.values();
    this.suit = suits[int(random(suits.length))];
    this.rank = ranks[int(random(ranks.length))];
    this.facing = Face.Back;
    this.name = this.rank + " of " + this.suit;
    float shortEdge = min(width, height);
    this.pos = new PVector(width * 0.5, height * 0.5);
    // The traditional dimensions of a playing card are 2.5" x 3.5",
    // which is an aspect ratio of 1 : 1.4 or 0.7143 : 1.
    this.scale = new PVector(shortEdge * 0.714 * screenScale, shortEdge * screenScale);
  }

  Card(float x, float y, float w, float h) {
    Rank[] ranks = Rank.values();
    Suit[] suits = Suit.values();
    this.suit = suits[int(random(suits.length))];
    this.rank = ranks[int(random(ranks.length))];
    this.facing = Face.Back;
    this.name = this.rank + " of " + this.suit;
    this.pos = new PVector(x, y);
    this.scale = new PVector(w, h);
  }

  Card(Suit suit, Rank rank) {
    this.suit = suit;
    this.rank = rank;
    this.facing = Face.Back;
    this.name = this.rank + " of " + this.suit;
    this.pos = new PVector(width * 0.5, height * 0.5);
    float shortEdge = min(width, height);
    this.scale = new PVector(shortEdge * 0.714 * screenScale, shortEdge * screenScale);
  }

  Card(Suit suit, Rank rank, float x, float y, float w, float h) {
    this.suit = suit;
    this.rank = rank;
    this.facing = Face.Back;
    this.name = this.rank + " of " + this.suit;
    this.pos = new PVector(width * 0.5, height * 0.5);
    this.pos = new PVector(x, y);
    this.scale = new PVector(w, h);
  }

  // OVERRIDES

  public String toString() {
    return this.name;
  }

  // INSTANCE METHODS

  public int compareTo(Card card) {
    // First sort by suit.
    int suitComparison = this.suit.value.compareTo(card.suit.value);
    // If this card and the comparisand card are of the same suit, the function
    // compareTo() will return 0. If it returns 0, then compare the cards based
    // on rank. The function compareTo is available to the object
    // version of Integer, but not to the primitive variable int.
    if (suitComparison == 0) {
      return this.rank.value.compareTo(card.rank.value);
    } else {
      return suitComparison;
    }
  }

  public Integer compareValue(Card card) {
    return this.rank.value.compareTo(card.rank.value);
  }

  public void printComparison(Card card) {
    int i = this.compareValue(card);
    if (i <= -1) {
      println(this + " is lesser in value than " + card);
    } else if (i >= 1) {
      println(this + " is greater in value than " + card);
    } else {
      println(this + " is equal in value to " + card);
    }
  }

  public Boolean sameSuit(Card card) {
    return this.suit == card.suit;
  }

  public Boolean sameRank(Card card) {
    return this.rank == card.rank;
  }

  public Boolean sameColor(Card card) {
    return this.suit.value == card.suit.value;
  }

  public Boolean bounds() {
    return mouseX > this.pos.x - this.scale.x * 0.5 && mouseX < this.pos.x + this.scale.x * 0.5
      && mouseY > this.pos.y - this.scale.y * 0.5 && mouseY < this.pos.y + this.scale.y * 0.5;
  }

  public Boolean bounds(float x, float y) {
    return x > this.pos.x - this.scale.x * 0.5 && x < this.pos.x + this.scale.x * 0.5
      && y > this.pos.y - this.scale.y * 0.5 && y < this.pos.y + this.scale.y * 0.5;
  }

  // The ternary operator can be used to condense if-else conditions.
  // The syntax asks in effect, Is condition true? Do true case : do else case.
  // See http://alvinalexander.com/java/edu/pj/pj010018 .
  public void flip() {
    this.facing =
      this.facing == Face.Back
      ? Face.Front
      : Face.Back;
  }

  public void moveTo(PVector dest, float speed) {
    this.pos.lerp(dest, speed);
  }

  public void draw() {
    pushMatrix();
    pushStyle();
    translate(this.pos.x, this.pos.y);
    rectMode(CENTER);
    ellipseMode(RADIUS);
    if (this.facing == Face.Back) {
      drawBack();
    } else {
      drawFront();
    }
    popStyle();
    popMatrix();
  }

  public void mousePressed() {
    if (this.bounds()) {
      this.flip();
    }
  }

  private void drawBack() {
    noStroke();

    if (bounds(mouseX, mouseY)) {
      fill(235, 0, map(this.pos.x, 0, width, 0, 127));
      rect(0, 0, this.scale.x, this.scale.y, this.cornerRounding);
    } else {
      fill(200, 0, map(this.pos.y, 0, height, 0, 127));
    }
    rect(0, 0, this.scale.x, this.scale.y, this.cornerRounding);
    fill(220, 0, map(this.pos.y, 0, height, 0, 127));
    beginShape();
    vertex(-this.scale.x * 0.475, 0);
    vertex(0, -this.scale.y * 0.475);
    vertex(this.scale.x * 0.475, 0);
    vertex(0, this.scale.y * 0.475);
    beginContour();
    vertex(0, this.scale.y * 0.125);
    vertex(this.scale.x * 0.125, 0);
    vertex(0, -this.scale.y * 0.125);
    vertex(-this.scale.x * 0.125, 0);
    endContour();
    endShape(CLOSE);
    float incr = map(mouseX, 0, width, 0.15, 0.25);
    for (float theta = map(mouseY, 0, height, 0, QUARTER_PI); theta < TWO_PI; theta += incr) {
      float radius = this.scale.x * 0.0045 * theta;
      float cos1 = map(cos(theta), -1, 1, (-this.scale.x * 0.425) + radius, (this.scale.x * 0.425) - radius);
      float sin1 = map(sin(theta), -1, 1, (-this.scale.y * 0.425) + radius, (this.scale.y * 0.425) - radius); 
      float cos2 = map(cos(theta + PI), -1, 1, (-this.scale.x * 0.3) + radius, (this.scale.x * 0.3) - radius);
      float sin2 = map(sin(theta + PI), -1, 1, (-this.scale.y * 0.3) + radius, (this.scale.y * 0.3) - radius);
      strokeWeight(1);
      stroke(150, 0, map(this.pos.y, 0, height, 0, 117), map(theta, 0, TWO_PI, 0, 255));
      line(0, 0, cos1, 
        sin1);
      stroke(125, 0, map(this.pos.y, 0, height, 0, 107), map(theta, 0, TWO_PI, 0, 255));
      line(0, 0, cos2, sin2);
      noStroke();
      fill(180, 0, map(this.pos.y, 0, height, 0, 127));
      ellipse(cos1, sin1, radius, radius);
      ellipse(cos2, sin2, radius, radius);
      fill(255, 204);
      ellipse(cos1, sin1, radius * 0.3, radius * 0.3);
      ellipse(cos2, sin2, radius * 0.3, radius * 0.3);
    }

    noFill();
    strokeWeight(1);
    stroke(255);
    rect(0, 0, this.scale.x * 0.975, this.scale.y * 0.975, this.cornerRounding);
    strokeWeight(map(height, 128, displayHeight, 1, 2));
    rect(0, 0, this.scale.x * 0.925, this.scale.y * 0.925, this.cornerRounding);
    ellipse(0, -this.scale.y * 0.025, this.scale.x * 0.1125, this.scale.x * 0.1125);
    ellipse(0, this.scale.y * 0.025, this.scale.x * 0.1125, this.scale.x * 0.1125);
    if (frameCount % int(random(80, 120)) != 0) {
      strokeWeight(map(height, 128, displayHeight, 1, 5));
      ellipse(0, 0, this.scale.x * 0.045, this.scale.x * 0.045);
    }

    noStroke();
    fill(255);
    ellipse(0, -this.scale.y * 0.15, this.scale.x * 0.02125, this.scale.x * 0.02125);
    ellipse(0, this.scale.y * 0.15, this.scale.x * 0.02125, this.scale.x * 0.02125);
  }

  color hoverFront = color(12, 0, 48); 
  color notHoverFront = color(0, 0, 0);
  color currentFront = color(0, 0, 0);

  private void drawFront() {
    noStroke();

    if (this.rank == Rank.King && this.suit == Suit.Diamonds) {
      if (bounds(mouseX, mouseY)) {
        currentFront = lerpColor(currentFront, hoverFront, 0.05);
      } else {
        currentFront = lerpColor(currentFront, notHoverFront, 0.05);
      }
      fill(currentFront);
      rect(0, 0, this.scale.x, this.scale.y, this.cornerRounding);

      // gradient
      for (float i = -this.scale.y * 0.4285; i <= this.scale.y * 0.4285; ++i) {
        stroke(map(i, -this.scale.y * 0.4285, this.scale.y * 0.4285, 0, 204), 
          0, 42);
        line(-this.scale.x * 0.4285, i, this.scale.x * 0.4285, i);
      }
      noFill();
      stroke(255);
      strokeWeight(1);
      rect(0, 0, this.scale.x * .857, this.scale.y * .857);

      // diamond upper
      for (int i = 0; i < 30; ++i) {
        strokeWeight(map(i, 0, 30, 2, 0.25));
        line(map(i, 0, 30, -this.scale.x * 0.25, 0), 
          map(i, 0, 30, -this.scale.y * 0.01, -this.scale.y * 0.4225), 
          map(i, 0, 30, this.scale.x * 0.25, 0), 
          map(i, 0, 30, -this.scale.y * 0.01, -this.scale.y * 0.4225));
      }

      // crown
      strokeWeight(1);
      fill(currentFront);
      beginShape();

      vertex(-this.scale.x * 0.25, 0);
      vertex(this.scale.x * 0.25, 0);
      vertex(this.scale.x * 0.35, -this.scale.y * 0.15);
      vertex(this.scale.x * 0.125, -this.scale.y * 0.075);
      vertex(0, -this.scale.y * 0.175);
      vertex(-this.scale.x * 0.125, -this.scale.y * 0.075);
      vertex(-this.scale.x * 0.35, -this.scale.y * 0.15);
      beginContour();
      vertex(0, -this.scale.y * 0.135);
      vertex(this.scale.x * 0.10, -this.scale.y *0.06);
      vertex(0, -this.scale.y * 0.02);
      vertex(-this.scale.x * 0.10, -this.scale.y *0.06);
      endContour();
      endShape(CLOSE);

      // diamond lower
      for (int i = 0; i < 30; ++i) {
        strokeWeight(map(i, 0, 30, 2, 0.25));
        line(map(i, 0, 30, -this.scale.x * 0.25, 0), 
          map(i, 0, 30, this.scale.y * 0.01, this.scale.y * 0.4225), 
          map(i, 0, 30, this.scale.x * 0.25, 0), 
          map(i, 0, 30, this.scale.y * 0.01, this.scale.y * 0.4225));
      }

      noStroke();
      fill(24, 0, 42, 54);
      quad(0, this.scale.y * 0.01, 
        this.scale.x * 0.12, this.scale.y * 0.2, 
        0, this.scale.y * 0.4, 
        -this.scale.x * 0.12, this.scale.y * 0.2
        );
      fill(42, 0, 64, 102);
      quad(0, this.scale.y * 0.01, 
        this.scale.x * 0.102, this.scale.y * 0.2, 
        0, this.scale.y * 0.4, 
        -this.scale.x * 0.102, this.scale.y * 0.2
        );
              fill(255, 0, 64, 215);
      quad(0, this.scale.y * 0.01, 
        this.scale.x * 0.082, this.scale.y * 0.2, 
        0, this.scale.y * 0.4, 
        -this.scale.x * 0.082, this.scale.y * 0.2
        );
        textAlign(CENTER, CENTER);
        fill(255);
        textSize(this.scale.y * 0.1);
        text("K", 0, this.scale.y * 0.2);
    } else {
      if (bounds(mouseX, mouseY)) {
        fill(0, map(mouseX, 0, width, 0, 127), 255);
      } else {
        fill(0, map(mouseY, 0, height, 0, 54), 240);
      }
      rect(0, 0, this.scale.x, this.scale.y, this.cornerRounding);
      drawLabel();
    }
  }

  private void drawLabel() {
    textAlign(CENTER, CENTER);
    textSize(14);
    fill(255);
    text(this.rank.toString() + "\r\nof\r\n" + this.suit, 0, 0);
  }
}