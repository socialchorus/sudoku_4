class Board
  SIZE = 4
  attr_accessor :cells
  attr_reader :stdin, :stdout

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
    @cells = (0..15).map { |id| Cell.new(id, SIZE) }
  end

  def full? 
    !get_empty_cell
  end

  def valid?
    (1..SIZE).all? do |num|
      [:row, :column, :group].all? do |collection_type|
        Validator.new(get_values_for(collection_type, num), SIZE).valid? 
      end
    end
  end

  def print
    printer = Printer.new(self, stdout)
    printer.print
  end

  def value_at(id)
    found_cell(id).value || " "
  end

  def values
    cells.map {|cell| cell.value}.compact
  end

  def set_value(index, value)
    found_cell(index).value = value
  end

  def clear_row
    get_collection(:row, last_filled_row || 1).each do |cell|
      cell.value = nil
    end
  end

  def clear # DELETE?
    cells.each { |cell| cell.value = nil }
  end

  def fill_empty_row #TODO: CIWK, code ugly
    row_values = generate_row_values
    get_empty_row.each do |cell| 
      cell.value = row_values.pop #could also be shift
    end
  end

  def fill_empty_cell # DELETE?
    get_empty_cell.generate_value
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

  def last_filled_row
    return nil if get_filled_cells.empty?
    filled_cells_ids = get_filled_cells.map { |cell| cell.id }
    cells[filled_cells_ids.max].row
  end

  def get_filled_cells
    cells.select { |cell| !cell.empty? }
  end

  def get_empty_row #TODO rename last_filled_row?
    empty_row_number = (last_filled_row || 0) + 1
    cells.select { |cell| cell.row == empty_row_number }
  end

  def generate_row_values
    (1..SIZE).to_a.shuffle
  end

  def get_empty_cell # DELETE if removed from full?
    cells.detect { |cell| cell.empty? }
  end
end