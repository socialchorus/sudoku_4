class Board
  BOARD_SIZE = 4
  attr_accessor :cells
  attr_reader :stdin, :stdout

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
    @cells = (0..15).map {|id| Cell.new(id)}
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
    units_valid?(:row) #&& units_valid?(:column) && units_valid?(:group)
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

  def units_valid?(unit)
    unit_statuses = []
    (1..BOARD_SIZE).each do |unit_num|
      unit_values = get_unit_values(unit, unit_num)
      unit_status = unit_values.compact.uniq == unit_values.compact  
      unit_statuses << unit_status
    end
    !unit_statuses.include?(false)
  end

  # def get_unit_values(unit, unit_num)
  #   get_unit(unit, unit_num).map { |cell| cell.value }
  # end

  # def get_unit(unit, unit_num)
  #   cells.select { |cell| cell.unit == unit_num }
  # end

  def rows_valid? 
    row_statuses = []
    (1..BOARD_SIZE).each do |row|
      row_values = get_row_values(row)
      row_status = row_values.compact.uniq == row_values.compact  
      row_statuses << row_status
    end
    !row_statuses.include?(false)
  end

  def get_row_values(row)
    get_row(row).map { |cell| cell.value }
  end

  def get_row(row)
    cells.select { |cell| cell.row == row }
  end

  # def columns_valid?
  #   column_statuses = []
  #   (1..BOARD_SIZE).each do |column|
  #     column_values = get_column_values(column)
  #     column_status = column_values.compact.uniq == column_values.compact  
  #     column_statuses << column_status
  #   end
  #   !column_statuses.include?(false)
  # end

  # def get_column_values(column)
  #   get_column(column).map { |cell| cell.value }
  # end

  # def get_column(column)
  #   cells.select { |cell| cell.column == column }
  # end

  def print
    printer = Printer.new(self, stdout)
    printer.print
  end
end
