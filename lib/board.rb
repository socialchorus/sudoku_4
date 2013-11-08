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
    !cells.any? { |cell| cell.empty? }
  end

  def valid?
    (1..SIZE).all? do |num|
      [:row, :column, :group].all? do |collection_type|
        collection_call(get_collection(collection_type, num)).valid?
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

  def fill_empty_row
    collection_call(first_empty_row).generate_values
  end

  # -----------------------------------------------------

  def get_collection(collection_type, num)
    cells.select { |cell| cell.send(collection_type) == num }
  end

  def found_cell(id)
    cells.detect { |cell| cell.id == id }
  end

  def first_empty_row
    rows.detect { |row| collection_call(row).empty? }
  end

  def collection_call(collection)
    CollectionManager.new(collection, SIZE)
  end

  def clear_row
    return if last_filled_row == nil
    collection_call(last_filled_row).clear
  end

  def last_filled_row
    rows.select { |row| !collection_call(row).empty? }.last
  end

  def rows
    (1..SIZE).map { |row_num| get_collection(:row, row_num)}
  end
end