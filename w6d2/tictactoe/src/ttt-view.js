class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $ul = $('ul');
    $ul.on('click', 'li', (e) => this.toggleMove(e));

  }

  makeMove($square) {
    $square.addClass(this.game.currentPlayer);
    let squareId = $square.attr('class')[0];
    let row = Math.floor(squareId / 3);
    let col = Math.floor(squareId % 3);
    const pos = [row,col];
    this.game.playMove(pos);
  }

  setupBoard() {
    const $figure = $('figure');
    $figure.append('<ul></ul>');

    const $ul = $('ul');
    for (let i = 0; i < 9; i++) {
      $ul.append(`<li class="${i}"></li>`);
    }
    const $li = $('li');
    $li.hover(this.toggleHighlight);
  }

  toggleHighlight(event) {
    event.stopPropagation();
    const $li = $(event.target);
    $li.toggleClass('hover');
  }

  toggleMove(event) {
    event.stopPropagation();
    const $li = $(event.target);
    $li.toggleClass(this.game.currentPlayer);
    this.makeMove($li);
  }

}



module.exports = View;
