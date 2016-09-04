var testDict;
var notes;

var maxVolume = 0.8;
var fadeIn = 1;
var fadeOut = 0.5;

var fft;
var wave;
var typeIndex = 0;

function setup() {
  createCanvas(840, 420);
  background(32);
  noStroke();

  testDict = new Dictionary();
  testDict.add("mno", "pqr");
  testDict.add("ghi", "jkl");
  testDict.add("abc", "def");
  testDict.add("mno", "stu", true);
  console.log("after 4 additions: " + testDict);
  console.log("removed key: " + testDict.remove("abc"));
  console.log("after 1 removal: " + testDict);
  console.log("get value: " + testDict.getValue("ghi"));
  console.log("get value: " + testDict.getValue("xyz"));
  var ks = testDict.getKeys();
  console.log("keys: " + ks);
  var vs = testDict.getValues();
  console.log("values: " + vs);
  testDict.add("xyz", "blah");
  testDict.add("uvw", "gwar");
  testDict.sort();
  console.log("after sorting: " + testDict);

  notes = new Dictionary();
  notes.add('B', new Note('B', 493.883));
  notes.add('A', new Note('A', 440));
  notes.add('G', new Note('G', 391.995));
  notes.add('F', new Note('F', 349.228));
  notes.add('E', new Note('E', 329.628));
  notes.add('D', new Note('D', 293.665));
  notes.add('C', new Note('C', 261.626));
  console.log(notes.toString());

  fft = new p5.FFT();
}

function draw() {

  if (frameCount % 10 == 0) {
    fill(32, 10);
    rect(0, 0, width, height);
  }

  playNotes();

  wave = fft.waveform();
  var size = wave.length;
  for (var i = 0; i < size; ++i) {
    var x = map(i, 0, size, 0, width);
    var y = map(wave[i], -1, 1, 0, height);
    var absY = abs(map(wave[i], -1, 1, -20, 20));
    fill(map(i, 0, size, 0, 255), map(y, 0, height, 0, 255), map(typeIndex, 0, 4, 127, 255), 127);
    ellipse(x, y, absY, absY);
  }
}

function keyPressed() {
  var i = notes.containsKey(key);
  if (i !== -1) {
    notes.kvps[i].v.pressed = true;
  }
}

function keyReleased() {
  var i = notes.containsKey(key);
  if (i !== -1) {
    notes.kvps[i].v.pressed = false;
  }
}

function mouseReleased() {
  typeIndex = (typeIndex + 1) % Note.types.length;
  console.log(Note.types[typeIndex]);
  var size = notes.kvps.length;
  for (var i = 0; i < size; ++i) {
    
    notes.kvps[i].v.oscillator.setType(Note.types[typeIndex]);
    
    
    
  }
}

function playNotes() {
  var size = notes.kvps.length;
  for (var i = 0; i < size; ++i) {
    if (notes.kvps[i].v.pressed) {
      notes.kvps[i].v.volume = maxVolume;
      notes.kvps[i].v.oscillator.amp(notes.kvps[i].v.volume, fadeIn);
    } else {
      notes.kvps[i].v.volume = 0;
      notes.kvps[i].v.oscillator.amp(notes.kvps[i].v.volume, fadeOut);
    }
  }
}