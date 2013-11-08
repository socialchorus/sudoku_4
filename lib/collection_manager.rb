class CollectionManager
  attr_accessor :collection, :board_size

  def initialize(collection, board_size)
    @collection = collection
    @board_size = board_size
  end

  def empty?
    collection.all? { |cell| cell.empty? }
  end

  def clear
    collection.each { |cell| cell.value = nil }
  end

  def values
    collection.map { |cell| cell.value }
  end

  def generate_values
    row_values = valid_values
    collection.each do |cell|
      cell.value = row_values.pop
    end
  end

  def valid?
    (values.compact.uniq == values.compact) && legal?
  end

  def legal?
    collection.size == board_size &&
    values.compact.all? { |element|
      element.is_a?(Fixnum) &&
      element >= 1 &&
      element <= board_size
    }
  end

  def valid_values
    (1..board_size).to_a.shuffle
  end
end