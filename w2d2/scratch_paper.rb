load 'board.rb'
load 'cursor.rb'
b = Board.new
c = Cursor.new([0,0], b)


b.grid.each do |row|
row.each do |pce|
p pce.type
end
end




def color
  if cursor.cursor_pos == [idx1, idx2] && !cursor.selected
    self.color = blue
  elsif cursor.cursor_pos == [idx1, idx2] && cursor.selected
    self.color = pink
  end
end


#           toggle_semaphore
#           next
#           end

# end



# class Display
#           case cursor.color
#           when pink
#             print_pink_cursor
#           when blue
#             print_blue_cursor
#           end

Chess Unicode Ref

white chess king	♔	U+2654	&#9812;
white chess queen	♕	U+2655	&#9813;
white chess rook	♖	U+2656	&#9814;
white chess bishop	♗	U+2657	&#9815;
white chess knight	♘	U+2658	&#9816;
white chess pawn	♙	U+2659	&#9817;
black chess king	♚	U+265A	&#9818;
black chess queen	♛	U+265B	&#9819;
black chess rook	♜	U+265C	&#9820;
black chess bishop	♝	U+265D	&#9821;
black chess knight	♞	U+265E	&#9822;
black chess pawn	♟	U+265F	&#9823;