require_relative 'card.rb'
require 'byebug'

class Board
attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(6) }
    make_deck
    populate(self.grid) #will this work? or set @grid to nil?
  end
  
def make_deck
  @deck = Array.new(18) { |i| Card.new(i) }
  @deck += @deck
  @deck.shuffle!
end

  def populate(grid) 
    grid.map! do |row|
      row.map! do |col|
        col = @deck.pop
      end
    end
  end 

  def render
  end



  def [](pos)
    row, col = pos
    self.grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    self.grid[row][col] = value
  end

  def reveal(guess)
    self[guess].face_value = :up
  end 




end