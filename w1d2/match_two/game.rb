require_relative 'board.rb'
require_relative 'card.rb'
require 'byebug'

class Game
  attr_accessor :guess, :prev_guess, :num_guesses
  attr_reader :board

  def initialize
    @guess = nil
    @prev_guess = nil
    @num_guesses = 0
    @board = Board.new
  end

  def play
    until won?
      render
      prompt
    end
    game_over
  end

  def render
    system("clear")
  end

  def prompt
    puts "Which row? (0 - 5)"
    row = gets.chomp.to_i
    puts "Which column? (0 - 5)"
    col = gets.chomp.to_i
    prev_guess = guess
    guess = [row, col]
    make_guess(guess)
  end

  def make_guess(guess)
    board.reveal(guess)
    self.num_guesses += 1
    if num_guesses % 2 == 0 && !match?
      puts "ERRRRRRTTTT wrong!"
      sleep(3)
       debugger
      self.board[prev_guess].hide 
      self.board[guess].hide
     
    end
  end

  def match?

    if prev_guess
      card1 = self.board[prev_guess].face_value
      card2 = self.board[guess].face_value
      
      card1 == card2
    end
  end
  
  def won?
    board.grid.each do |row|
      row.all? do |card| 
        return false unless card.state == :up
      end
    end 
  end

  def game_over
    puts "Game over. Great job!"
  end

end
  if __FILE__ == $PROGRAM_NAME 
    g = Game.new
    g.play 
  end
  

