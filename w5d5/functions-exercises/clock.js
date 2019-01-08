class Clock {
  constructor() {
    // 1. Create a Date object.
    const date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.  
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    this.time = `${this.hours}:${this.minutes}:${this.seconds}`;
    // Use console.log to print it.
    console.log(this.time);
  }

  _tick() {
    // 1. Increment the time by one second.

    // for our future selves: use ternary statements to pad zeroes,
    // try using nested if time < 59 set = 0 rather than modulo
    this.seconds = (this.seconds % 60) + 1;
  
    if (this.seconds % 60 < 10 && this.seconds % 60 > 0) {
      this.seconds = '0' + this.seconds;
      }
  
    if (this.seconds % 60 === 0) {
      this.minutes = (this.minutes % 60) + 1;
      if (this.minutes % 60 < 10) {
        this.minutes = '0' + this.minutes;
      } 
    }

    if (this.minutes % 60 === 0) {
      this.hours = (this.hours % 24) + 1;
      if (this.hours % 24 < 10) {
        this.hours = '0' + this.hours;
      }
    }
    

    // 2. Call printTime.
    // setInterval(printTime, 1000);
    this.printTime();
  }
}

const clock = new Clock();