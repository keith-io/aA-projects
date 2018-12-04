require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  attr_accessor :semaphore
  attr_reader :board

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
    @semaphore = true
  end

  def render
    board.grid.each do |row|
      toggle_semaphore
      row.each do |square|
        if semaphore 
          print "  ".colorize( :background => :light_black)
          toggle_semaphore
        else
          print "  ".colorize( :background => :cyan)
          toggle_semaphore
        end
      end
      puts    
    end
  end

  def toggle_semaphore
    self.semaphore = !semaphore
  end
end