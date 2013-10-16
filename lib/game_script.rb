board = Board.new
board.print

while !board.full?
	puts "Press enter to fill the next cell"
	gets
	board.fill_next_cell
	board.print 
end