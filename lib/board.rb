class Board
  attr_accessor :cells

  def initialize
    @cells = (0..15).map do |id|
      Cell.new(id)
    end
  end

  def value_at(id)
    found_cell = cells.detect {|cell| cell.id == id}
    found_cell.value || " "
  end

  def print
    printer = Printer.new(self)
    printer.print
  end

end