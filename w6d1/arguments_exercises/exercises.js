function mySum () {
  let result = 0;
  // let args = Array.from(arguments);
  let args = [];
  for(let i = 0; i < arguments.length; i++) {
    args.push(arguments[i]);
  }
  args.forEach((arg) => {

    result += arg;
  });
  return result;
}

// console.log(mySum(1,2,3));

function mySum2 (...args) {
// we expect args to be an array
// ...args destructures the array?
  let sum = 0;
  args.forEach(function(arg) {
    sum += arg;
  });
  return sum;
}

// console.log(mySum2(1, 2, 3));

// Using arguments keyword:
// Function.prototype.myBind = function(ctx) {
//   let bindArgs = Array.from(arguments).slice(1);
//   //slice bc arguments includes all arguments (even ctx)

//   // we need that = this bc function() style ctx is always window
//   // not necessary if we use ()=>{} because ctx will be inherited
//   const that = this;

//   // however, ()=>{} resets the arguments keyword 
//   // so callArgs will === bindArgs. Hence we must use function() style
//   return function() {
//     let callArgs = Array.from(arguments);
//     // we must return inside of the returned function 
//     // if we want to invoke the 'returned function'
//     return that.apply(ctx, bindArgs.concat(callArgs));
//     //'that' will not be invoked until it receives all the arguments it needs
//   };
// };


Function.prototype.myBind = function(ctx, ...bindTime) {
  return (...callTime) => {
    // no need for 'that' = 'this' bc not using 'arguments' keyword
    return this.apply(ctx, bindTime.concat(callTime));
  };
};

// const innerFunction = mySum2.myBind(null, 1,2,3);
// console.log(innerFunction(4, 5, 6));
// this(1,2,3);  =>  6

function curriedSum(numArgs) {
  const numbers = [];
  const _curriedSum = function(num) {
    numbers.push(num);
    
    if(numbers.length === numArgs) {
      let sum = 0; 
      numbers.forEach((num) => {
        sum += num;
      });
      return sum;
    } else {
      return _curriedSum;
    }
    
  }; 

  return _curriedSum;
}

// This only works when you know how many args to expect
// const _curriedSum = (num1) => (num2) => (num3) => num1 + num2 + num3;


Function.prototype.curry = function(numArgs) {
  const args = [];
  let that = this;
  const _curry = function(arg) {
    args.push(arg);
   
    // there are two ways to do this:
    if (args.length === numArgs) {
      // 1st way: .apply binds and invokes simultaneously
      // context is null bc we're assuming context doesn't matter
      // we're simply setting how many arguments the function ('that') requires
      // before it invokes
      return that.apply(null, args);

      // 2nd way: simply invoking it allows the receiver's bound ctx to be inherited
      // return that(...args);
    } else {
      return _curry;
    }
  };
  return _curry;
};


const sum = mySum.curry(4);
console.log(sum(5)(30)(20)(1)); // => 56

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56