const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallBack) {
  if (numsLeft === 0) {
    completionCallBack(sum);
  }
  
  if (numsLeft > 0) {
    reader.question('Give a number', (answer) => {
      const num = parseInt(answer);
      sum += num;
      numsLeft--;
      console.log(`Current Sum: ${sum}`);
      // reader.close(); 
      // recursive invocation must go inside the async function
      addNumbers(sum, numsLeft, completionCallBack);
    });
    // everything outside the async function gets run first
  }
}

// Actual invocation
addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
  reader.close();
});

// console.log(Object.getOwnPropertyNames(readline).filter(function (p) {
//   return typeof readline[p] === 'function';
// }));