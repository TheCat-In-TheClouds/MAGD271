function Dictionary() {
  this.kvps = [];
}

Dictionary.prototype.add = function(k, v, sortUponAddition) {
  var candidate = new KVP(k, v);
  // console.log("candidate: " + candidate);
  if (this.kvps.length > 0) {
    for (var i = 0; i < this.kvps.length; ++i) {
      if (candidate.k == this.kvps[i].k) {
        console.log("dictionary already contains key " + candidate.k + ". updating value to " + candidate.v + ".");
        this.kvps[i].v = candidate.v;
        if (sortUponAddition) {
          this.sort();
        }
        return false;
      }
    }
  }
  this.kvps.push(candidate);
  if (sortUponAddition) {
    this.sort();
  }
  return true;
}

Dictionary.prototype.clear = function() {
  this.kvps = [];
}

Dictionary.prototype.containsKey = function(k) {
  if (this.kvps.length > 0) {
    for (var i = 0; i < this.kvps.length; ++i) {
      if (k === this.kvps[i].k) {
        return i;
      }
    }
  }
  return -1;
}

Dictionary.prototype.containsValue = function(v) {
  if (this.kvps.length > 0) {
    for (var i = 0; i < this.kvps.length; ++i) {
      if (v === this.kvps[i].v) {
        return i;
      }
    }
  }
  return -1;
}

Dictionary.prototype.getKeys = function() {
  var ks = [];
  for (var i = 0; i < this.kvps.length; ++i) {
    ks.push(this.kvps[i].k);
  }
  return ks;
}

Dictionary.prototype.getValue = function(k) {
  if (this.kvps.length > 0) {
    for (var i = 0; i < this.kvps.length; ++i) {
      if (k === this.kvps[i].k) {
        return this.kvps[i].v;
      }
    }
  }
  return null;
}

Dictionary.prototype.getValues = function() {
  var vs = [];
  for (var i = 0; i < this.kvps.length; ++i) {
    vs.push(this.kvps[i].v);
  }
  return vs;
}

Dictionary.prototype.remove = function(k) {
  if (this.kvps.length > 0) {
    for (var i = 0; i < this.kvps.length; ++i) {
      if (k === this.kvps[i].k) {
        return this.kvps.splice(i, 1)[0];
      }
    }
  }
  return null;
}

Dictionary.prototype.sort = function(comparator) {
  if (comparator !== null) {
    this.kvps.sort(comparator);
  } else {
    this.kvps.sort(function(a, b) {
      return a.k > b.k;
    });
  }
}

Dictionary.prototype.toString = function() {
  var s = "";
  if (this.kvps.length > 0) {
    for (var i = 0; i < this.kvps.length; ++i) {
      s += this.kvps[i].toString();
      if (i < this.kvps.length - 1) {
        s += "&";
      }
    }
  }
  return s;
}

function KVP(k, v) {
  this.k = k;
  this.v = v;
}

KVP.prototype.toString = function() {
  return this.k + "=" + this.v;
}