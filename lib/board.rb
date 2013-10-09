class Board
  attr_accessor :cells

  def initialize
    @cells = (0..15).map do |index|
      Cell.new(index)
    end
    cells.shuffle
  end

  def value_at(id)
    found_cell = cells.detect{|cell| cell.id = id}
    found_cell.value  
  end

  def print
    Printer.new(self).print
  end
end
