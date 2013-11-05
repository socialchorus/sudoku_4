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
    take_turns
    stdout.puts "The board is complete!"
  end

  def printroduction
    board.print
  end

  def prompt_for_input
    stdout.puts "\n\n Press enter to fill the next cell"
    stdin.gets
  end
 
  def auto_take_turn
    prompt_for_input
    board.fill_empty_cell # TODO CHANGE! fill_empty_row
    board.print
    handle_invalid_board
  end

  def take_turn(index, value)
    board.set_value(index, value)
    board.print
    handle_invalid_board
  end

  def take_turns
    while !board.full?
      auto_take_turn
      puts number_of_turns.to_s
      self.number_of_turns += 1
    end
  end

  def handle_invalid_board
    return if valid?
    #puts values
    stdout.puts "The board is invalid!"
    board.clear
  end
end