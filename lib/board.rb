class Board
  SIZE = 4
  attr_accessor :cells
  attr_reader :stdin, :stdout

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
    @cells = (0..15).map { |id| Cell.new(id, SIZE) }
  end

  def values
    cells.map {|cell| cell.value}.compact
  end

  def set_value(index, value)
    found_cell(index).value = value
  end

  def clear
    cells.each { |cell| cell.value = nil }
  end

  def valid?
    (1..SIZE).all? do |num|
      [:row, :column, :group].all? do |collection_type|
        Validator.new(get_values_for(collection_type, num), SIZE).valid? 
      end
    end
  end

  def get_values_for(collection_type, num)
    collection = get_collection(collection_type, num)
    collection.map { |cell| cell.value }
  end

  def get_collection(collection_type, num)
    cells.select { |cell| cell.send(collection_type) == num }
  end

  def found_cell(id)
    cells.detect { |cell| cell.id == id }
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