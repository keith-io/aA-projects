require 'byebug'
require_relative 'piece.rb'
require_relative 'null_piece.rb'

class Board
  # attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @grid.each_with_index do |rank, idx|
      rank.each_with_index do |space, idx2|

        if idx < 2 || idx > 5
          @grid[idx][idx2] = Piece.new(:generic)
        else
          # debugger
          @grid[idx][idx2] = NullPiece.instance

        end
      end
    end
    p @board
  end

  def move_piece(start, finish)
    if self[start].class == NullPiece
      raise "Opps there's not a piece there"
    elsif !valid_move?
      raise "That is not a valid move."
    else
      self[finish] = self[start]
      self[start] = NullPiece.instance
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
  
end
# grid[][]
# move_piece([a,1], [a,2])

# rank = row
# file = column