require 'byebug'
require_relative 'pieces.rb'

class Board
  attr_reader :null, :grid
  def initialize
    @null = NullPiece.instance
    @grid = Array.new(8) { Array.new(8) { null } }
    populate
    p @board
  end

  def populate    
    @grid.each_with_index do |rank, idx|
      rank.each_with_index do |space, idx2|

        if idx < 2
          self[[idx,idx2]] = Piece.new(:black, self, [idx,idx2])
        elsif idx > 5
          self[[idx,idx2]] = Piece.new(:white, self, [idx,idx2])
        end
      end
    end
  end

  def move_piece(start, finish)
    if self[start].class == NullPiece
      raise "Opps there's not a piece there"
    elsif !valid_move?
      raise "That is not a valid move."
    else
      self[finish] = self[start]
      self[start] = null
    end
  end

  def valid_move?
    # Define this later
    # If move (start or finish) is off grid
    # if Piece can't make that type of move
    # if there is another one of your own pieces there
    true
  end

  def [](pos)
    col, row = pos
    @grid[col][row]
  end

  def []=(pos, piece)
    col, row = pos
    @grid[col][row] = piece
  end

  def valid_pos?(pos)
    x, y = pos
    return false if x < 0 || x > 7
    return false if y < 0 || y > 7
    true
  end
end
# grid[][]
# move_piece([a,1], [a,2])

# rank = row
# file = column
