class Cell
  attr_accessor :id, :value

  def initialize(id)
    @id = id
    @value = nil
  end

  def generate_value
    self.value = rand(1..4)
  end

  def empty?
    value.nil?
  end

end