function Note(n, f) {
  this.name = n;
  this.frequency = f;
  this.pressed = false;
  this.volume = 0;
  this.oscillator = new p5.Oscillator();
  // console.log(Note.types);
  // this.oscillator.setType(Note.types[1]);
  // console.log(this.oscillator.getType());
  this.oscillator.start();
  this.oscillator.amp(0);
  this.oscillator.freq(this.frequency);
}

Note.prototype.toString = function() {
  return this.name;
}

Note.types = ['sine', 'triangle', 'sawtooth', 'square'];