class Game
  attr_accessor :number_of_turns
  attr_reader :stdin, :stdout, :board 

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
    @board = Board.new(stdin, stdout)
    @number_of_turns = 0
  end

  def valid?
    board.valid?
  end

  def values
    board.values
  end

  def run
    printroduction
    fill_rows
    stdout.puts "The board is complete!"
  end

  def printroduction
    print
  end

  def prompt_for_input
    stdout.puts "\n\n Press enter to fill the next cell"
    stdin.gets
  end
 
  def auto_fill_row
    prompt_for_input
    board.fill_empty_row
    print
    handle_invalid_board
  end

  def fill_rows
    while !board.full?
      auto_fill_row
      puts number_of_turns.to_s
      self.number_of_turns += 1
    end
  end

  def set_value(index, value)
    board.set_value(index, value)
  end

  def print
    board.print
  end

  def handle_invalid_board
    return if valid?
    #puts values
    stdout.puts "The board is invalid!"
    board.clear_row
  end
end