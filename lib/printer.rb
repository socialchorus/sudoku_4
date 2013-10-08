class Printer
	attr_accessor :template #needs cells, and values from cells
	# This board needs the file, the presenter.
	def initialize
		@template = File.read("lib/template.txt")

	
	end

	def board_presenter
		# something to channel the values into unique variable 
		cell_counter = 1
		@cells.each do |cell|
			# go through each cell that in the Board class index and 
			# and assign it's own unique variable name that then plugs
			# into the template's string interpolation and makes sure
			# that value is tied to the unique variable.
			cell_counter += 1
			# feeding value information into a unique variable for each cell
		end
	         
	end

	#get information from presenter

end

print board (file, cell)
  "#{}".replace_with cell # what methods are available to us on the string class
end

# This is our attempt to make things print.
def board_presenter
	@template.replace(x, cell) # replace x in the string interpolation
	#with the unique instance of cell
	x = variable
end

# (File.read("lib/template.rb")())
#   "#{}".replace_with |cell| # what methods are available to us on the string class
# end
# new_game = Board.new

puts attempt("lib/template.rb", 2)