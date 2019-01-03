Array.prototype.myEach = function (cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
};

thing = [1, 2, 3, 4, 5, 9];
// thing.myEach(console.log);

Array.prototype.myMap = function (cb) {
  result = [];
  for (let i = 0; i < this.length; i++) {
    result.push(cb(this[i]));
  }
  return result;
};

// callback = function (el) {
//   return el + 5;
// };

// thing.myMap(callback);

Array.prototype.myReduce = function (callback, optV) {
  let acc;
  let arr;
  if (optV) {
    acc = optV;
    arr = this;
  } else {
    acc = this[0];
    arr = this.slice(1);
  }

  const x = function (el) {
    acc = callback(acc, el);
  };

  arr.myEach(x);
  return acc;
};