class Cell
  attr_accessor :id, :value
  attr_reader :row, :column, :group

  def initialize(id, board_size)
    @id = id
    @value = nil
    @row = ((id/board_size) + 1)
    @column = ((id%board_size) + 1)
    @group = calculate_group
  end

  def generate_value
    self.value = rand(1..4)
  end

  def empty?
    value.nil?
  end

  def calculate_group # TODO develop algorithm
    if [0,1,4,5].include?(id)
      1
    elsif [2,3,6,7].include?(id)
      2
    elsif [8,9,12,13].include?(id)
      3
    elsif [10,11,14,15].include?(id)
      4
    end
  end
end