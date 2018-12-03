class InvalidMoveError < StandardError
  def message
    "That's not a valid move"
  end
end
