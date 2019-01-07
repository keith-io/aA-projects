Array.prototype.uniq = function () {
  const hash = {};

  for (let i = 0; i < this.length; i++) {
    hash[this[i]] = true;
  }
  return Object.keys(hash);
};

Array.prototype.twoSum = function () {
  const hash = {};
  const pairs = [];

  for (let i = 0; i < this.length; i++) {
    if ( hash[ 0 - this[i]] ) {
      pairs.push([this.indexOf(0 - this[i]), i]);
    } else {
      hash[this[i]] = true;
    }
  }

  return pairs;
};

Array.prototype.transpose = function () {

  const arr = Array((this[0].length)).fill().map(el => []);

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      arr[j].push(this[i][j]);
    }
  }
  return arr;
};

//array[0].map((col, i) => array.map(row => row[i]));