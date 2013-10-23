class Board
  attr_accessor :cells
  attr_reader :stdin, :stdout

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
    @cells = (0..15).map {|id| Cell.new(id)}
  end

  def found_cell(id)
    cells.detect {|cell| cell.id == id}
  end

  def value_at(id)
    found_cell(id).value || " "
  end

  def full? 
    !get_empty_cell
  end

  def get_empty_cell
    cells.detect { |cell| cell.empty? }
  end

  def fill_empty_cell
    get_empty_cell.generate_value
  end

  def print
    printer = Printer.new(self, stdout)
    printer.print
  end

end