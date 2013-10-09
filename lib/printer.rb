class Printer
  attr_accessor :board

  def initialize(board)
    # @template = open("lib/template.txt").read
    @board = board
  end

  def mustache_board

  end

  def board_presenter
    # template.send(board_hash_creator)
  end

  def read_board
  end

  # Gets matching patterns /\{{2}\d+\}{2}/
  def get_mustache
  end

  def num_extractor
    from_template = get_mustache.detect{|digit| digit = \d+} 
    from_template
  end

# Read board


# Extracts the number
# calls value_at(#)
# Render / sticks it back in
# Print

  def print
    # board.value_at(num_extractor)
  end

end
