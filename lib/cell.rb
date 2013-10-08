class Cell
  attr_accessor :index, :value

  BOARD_SIZE = 4

	def initialize(index) #index here connects with the index 
    #under the board class because the board class' initalize 
    #method calls on Cell.new
		@index = index
	end

  def row
  	(index % BOARD_SIZE) + 1 # The mod of the number (+1) 
    #should give us the row.
  end

  def column
  	(index / BOARD_SIZE) + 1 # The number, divisble by the board size, + 1 is equal to the column #.
  end

  def group
    case index
    when 0,1,4,5
      1
    when 2,3,6,7
      2
    when 8,9,12,13
      3
    when 10,11,14,15
      4
    end
    # to be refactored 
  end

  # def cell_update
  #   @value = new_value
  # end

	# or do we want to create different generators for row and column?
end