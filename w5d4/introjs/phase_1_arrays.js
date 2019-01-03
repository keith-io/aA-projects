Array.prototype.uniq = function () {
  const hash = {};

  for (let i = 0; i < this.length; i++) {
    hash[this[i]] = true;
  }
  return Object.keys(hash);
};