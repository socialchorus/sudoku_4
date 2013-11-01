class Cell
  BOARD_SIZE = 4
  attr_accessor :id, :value, :row, :column, :group

  def initialize(id)
    @id = id
    @value = nil
    @row = ((id/BOARD_SIZE) + 1)
    @column = ((id%BOARD_SIZE) + 1)
    @group = 1,2,5,6
  end

  def generate_value
    self.value = rand(1..4)
  end

  def empty?
    value.nil?
  end
end