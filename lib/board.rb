
class Board
	attr_accessor :cells

	def initialize
		@cells = (0..15).map do |index|
			Cell.new(index)
		end
	end
end

puts Board.new