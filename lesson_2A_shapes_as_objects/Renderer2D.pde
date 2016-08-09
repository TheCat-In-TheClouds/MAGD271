class Renderer2D {
  
  color fillColor = color(255);
  Stroke stroke = new Stroke();
  boolean noFill = false;

  Renderer2D() {
    this.fillColor = color(255);
    this.stroke = new Stroke();
  }

  Renderer2D(color fillColor) {
    this.fillColor = fillColor;
    this.stroke = new Stroke(color(0),0);
  }

  Renderer2D(Stroke stroke) {
    this.stroke = stroke;
    this.noFill = true;
  }

  Renderer2D(color fillColor, Stroke stroke) {
    this.fillColor = fillColor;
    this.stroke = stroke;
  }
  
  public String toString() {
    return "RENDERER2D [\r\nfillColor: #" + hex(this.fillColor)
      + ",\r\nstroke: " + this.stroke.toString()
      + ",\r\nnoFill: " + this.noFill
      + " ]";
  }
}