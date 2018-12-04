require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  attr_accessor :semaphore
  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
    @semaphore = true
  end

  def test_loop
    system("clear")
    render
    while true
      cursor.get_input
      system("clear")
      render
      p cursor.cursor_pos
    end
  end

  def render
    board.grid.each_with_index do |row, idx1|
      toggle_semaphore
      row.each_with_index do |square, idx2|
        if cursor.cursor_pos == [idx1, idx2]
          print "  ".colorize( :background => :blue)
          toggle_semaphore
          next
        end

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