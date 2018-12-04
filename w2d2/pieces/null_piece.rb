require_relative 'piece.rb'
require 'singleton'

class NullPiece < Piece
  include Singleton
  def initialize

    def color
    @color = nil
    end
    
    def board
    end

  end
end
