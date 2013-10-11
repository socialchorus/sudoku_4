class Board
  attr_accessor :cells

  def initialize
    @cells = (0..15).each do |id|
      Cell.new(id)
    end
  end

  # def value_at(id)
  #   id_for_value = cells.detect{ |cell| cell.id == id }
  #   id_for_value.value
  # end

  def print
    true
  end

end