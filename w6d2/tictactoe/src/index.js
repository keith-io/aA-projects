const View = require('./ttt-view.js');
const Game = require('../solution/game.js');



$(() => {
  const $ul = $('ul')
  const view = new View(new Game(), $ul);
 
});




