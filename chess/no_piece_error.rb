class NoPieceError < StandardError
  def message
    puts "Ooops, there isn't a piece there"
  end
end
