class Validator
  attr_accessor :collection, :board_size

  def initialize(collection, board_size)
    @collection = collection
    @board_size = board_size
  end

  def valid?
    (collection.compact.uniq == collection.compact) && legal?
  end

  def legal?
    collection.size == board_size &&
    collection.compact.all?{ |element| 
      element.is_a?(Fixnum) &&
      element >= 1 && 
      element <= board_size 
    }
  end
end