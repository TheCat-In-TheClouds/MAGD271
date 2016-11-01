import java.lang.RuntimeException.*;

class DraggableCircle extends Ellipse implements Draggable {

  color activeFillColor = color(255, 204, 0);
  color hoverFillColor = color(255, 127, 0);
  color inactiveFillColor = color(255, 0, 27);
  color activeStrokeColor = color(255);
  color hoverStrokeColor = color(235);
  color inactiveStrokeColor = color(215);
  float fadeTime = 0.05;
  boolean isBeingDragged = false;

  DraggableCircle(PVector center, float radius) {
    super(RADIUS, center, new PVector(radius, radius));
    this.fillColor = this.inactiveFillColor;
    this.noStroke = true;
  }

  DraggableCircle(float cx, float cy, float radius) {
    super(RADIUS, cx, cy, radius, radius);
    this.fillColor = this.inactiveFillColor;
    this.noStroke = true;
  }

  void draw() {
    draw(mouseX, mouseY);
  }

  void draw(float x, float y) {
    if (this.bounds(x, y)) {
      if (mousePressed && mouseButton == LEFT) {
        this.fillColor = this.activeFillColor;
        this.strokeColor = this.activeStrokeColor;
        if (!IS_DRAGGING) {
          this.isBeingDragged = true;
        }
        if (IS_DRAGGING && this.isBeingDragged) {
          this.update(x, y);
        }
      } else {
        this.fillColor = lerpColor(this.fillColor, this.hoverFillColor, fadeTime);
        this.strokeColor = lerpColor(this.strokeColor, this.hoverStrokeColor, fadeTime);
        this.isBeingDragged = false;
      }
    } else {
      this.fillColor = lerpColor(this.fillColor, this.inactiveFillColor, fadeTime);
      this.strokeColor = lerpColor(this.strokeColor, this.inactiveStrokeColor, fadeTime);
    }
    super.draw();
  }

  boolean bounds() {
    return bounds(mouseX, mouseY);
  }

  boolean bounds(PVector v) {
    return bounds(v.x, v.y);
  }

  boolean bounds(float x, float y) {
    float d = dist(this.center.x, this.center.y, x, y);
    if (this.noFill && !this.noStroke && this.strokeWeight > 1) {
      return d < this.radii.x + (this.strokeWeight / 2.0) &&
        d > this.radii.x - (this.strokeWeight / 2.0);
    } else {
      return d < this.radii.x;
    }
  }

  boolean isInside(Ellipse c) {
    float rMin;
    if (c.radii.x != c.radii.y) {
      rMin = min(c.radii.x, c.radii.y);
    } else {
      rMin = c.radii.x;
    }
    
    if (dist(this.center.x, this.center.y, c.center.x, c.center.y) < abs(this.radii.x - rMin)) {
      return true;
    }
    return false;
  }
}