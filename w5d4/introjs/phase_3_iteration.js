Array.prototype.bubbleSort = function () {
  let unsorted = true;

  while (unsorted) {
    unsorted = false;
    for (let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        [this[i], this[i + 1]] = [this[i + 1], this[i]];
        unsorted = true;
      }
    }
  }
  return this;
};

String.prototype.subStrings = function (string) {
  let subs = [];

  for (let start = 0; start < this.length; start++) {
    for (let end = start; end < this.length; end++) {
      subs.push(this.slice(start, (end + 1)));
    }
  }
  return subs;
};