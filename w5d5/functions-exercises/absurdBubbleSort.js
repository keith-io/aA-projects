const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} bigger than ${el2}\n`, (answer) => {
    const bool = (answer === 'yes') ? true : false;
    callback(bool);
    reader.close();    
  });
}

const cb = function callback() {
  console.log("it worked");
}

// askIfGreaterThan(3, 1, cb);
let madeAnySwaps;

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  madeAnySwaps = false;

  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], (isGreaterThan) => {
  
      if (isGreaterThan) {
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
        madeAnySwaps = true;
      }
    });
    innerBubbleSortLoop(arr, (i + 1), cb);
  
  } else if (i == (arr.length -1)) {
    cb(madeAnySwaps);
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    while (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    }
    sortCompletionCallback(arr);
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

// innerBubbleSortLoop([5,1,2,3], 0, cb);