Function.prototype.inherits = function(superClass) {
  // alternatively we can do this
  // let Surrogate = function() {}

  function Surrogate() {}
    Surrogate.prototype = superClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
};

function MovingObject() { }

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

MovingObject.prototype.fly = function() {
  // this.position = [x, y];
  console.log('wooosh');
};

Ship.prototype.shootLaser = function() {
  console.log("pew pew");
};

const enterprise = new Ship();
const hailey = new Asteroid();
const ufo = new MovingObject();

console.log(typeof hailey);
// console.log(enterprise typeof MovingObject);
console.log(ufo instanceof MovingObject);

ufo.shootLaser();
hailey.shootLaser();
enterprise.shootLaser();
enterprise.fly(1,2);

//