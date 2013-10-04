class Board
	def initialize 
		board = [[cell,cell,cell,cell],
							[cell,cell,cell,cell],
							[cell,cell,cell,cell],
							[cell,cell,cell,cell]]
						
	          puts <<-BOARD
							 ___ ___  ___ ___
							| #{board[0][0]} | #{board[0][1]} || #{board[0][2]} | #{board[0][3]} |
							|___|___||___|___|
							| #{board[1][0]} | #{board[1][1]} || #{board[1][2]} | #{board[1][3]} |
							|___|___||___|___|
							 ___ ___  ___ ___
							| #{board[2][0]} | #{board[2][1]} || #{board[2][2]} | #{board[2][3]} |
							|___|___||___|___|
							| #{board[3][0]} | #{board[3][1]} || #{board[3][2]} | #{board[3][3]} |
							|___|___||___|___|
						BOARD

						#  ___ ___  ___ ___
						# |   |   ||   |   |
						# |___|___||___|___|
						# |   |   ||   |   |
						# |___|___||___|___|
						#  ___ ___  ___ ___
						# |   |   ||   |   |
						# |___|___||___|___|
						# |   |   ||   |   |
						# |___|___||___|___|
	end
	def cell
		cell = 7
	end
end

# class Cell
# 	def initialize

# 	end
# end

new_game = Board.new


# print "
#  ___ ___  ___ ___
# |   |   ||   |   |
# |___|___||___|___|
# |   |   ||   |   |
# |___|___||___|___|
#  ___ ___  ___ ___
# |   |   ||   |   |
# |___|___||___|___|
# |   |   ||   |   |
# |___|___||___|___|"