class Validator
  attr_accessor :collection

  def initialize(collection, board_size)
    @collection = collection
  end

  def valid?

    # TODO incorporate legal
    collection.compact.uniq == collection.compact
  end

  def legal? # TODO finish this
    collection.none?{ |num| 
      num < 1 || 
      num > board_size || 
      num.is_a?(String) 
    }
  end
end