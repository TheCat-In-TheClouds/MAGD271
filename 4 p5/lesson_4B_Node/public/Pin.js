function Pin(id, x, y, r) {
  if(id === null || id === undefined) { this.id = "-1"; }
  else { this.id = id; }
  this.x = x;
  this.y = y;
  this.r = r;
}
