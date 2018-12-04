require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  attr_accessor :semaphore, :selected_pos
  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
    @semaphore = true
    @selected_pos = nil
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

        # if selected_pos == [idx1, idx2] && cursor.selected
        #   print_pink_cursor
        # #   toggle_semaphore
        # end

        # Fix this tomorrow
        if cursor.selected && selected_pos == [idx1, idx2]
          @selected_pos = [idx1, idx2]
          print_pink_cursor
          toggle_semaphore
          next
        else
          @selected_pos = nil
        end

        if cursor.cursor_pos == [idx1, idx2] 
          print_blue_cursor
          toggle_semaphore
          next
        end

        if semaphore 
          render_grey_square
          toggle_semaphore
        else
          render_cyan_square
          toggle_semaphore
        end


      end
      puts    
    end
  end

  def toggle_semaphore
    self.semaphore = !semaphore
  end

  def print_blue_cursor
    print "  ".colorize( :background => :blue)
  end

  def print_pink_cursor
    print "  ".colorize( :background => :light_magenta)
  end
  
  def render_grey_square
    print "  ".colorize( :background => :light_black)
  end

  def render_cyan_square
    print "  ".colorize( :background => :cyan)
  end
end