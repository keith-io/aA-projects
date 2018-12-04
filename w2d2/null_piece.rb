require_relative 'piece.rb'
require 'singleton'

class NullPiece < Piece
  include Singleton
  def initialize(type = "nullpiece")
    @type = type
    super
  end
end
