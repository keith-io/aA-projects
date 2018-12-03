require_relative 'piece.rb'
require_relative 'no_piece_error.rb'

class Board
  # attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @grid.each_with_index do |rank, idx|
      rank.each_with_index do |space, idx2|
        if idx < 2 || idx > 5
          @grid[idx][idx2] = Piece.new("null")
        end
      end
    end
    p @board
  end

  def move_piece(start, finish)
    if self[start].nil?
      raise "Opps there's not a piece there"
    elsif !valid_move?
      raise "That is not a valid move."
    end
  end

  def valid_move?

  end

  def [](pos)
    col, row = pos
    @grid[col][row]
  end
end
# grid[][]
# move_piece([a,1], [a,2])

# rank = row
# file = column