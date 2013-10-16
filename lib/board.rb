class Board
  attr_accessor :cells

  def initialize
    @cells = (0..15).map {|id| Cell.new(id)}
  end

  def found_cell(id)
    cells.detect {|cell| cell.id == id}
  end

  def value_at(id)
    found_cell(id).value || " "
  end

  def full? 
    !first_empty_cell
  end

  def first_empty_cell
    cells.detect { |cell| cell.empty? }
  end

  def fill_next_cell
    first_empty_cell.generate_value
  end

  def print
    printer = Printer.new(self)
    printer.print
  end

end