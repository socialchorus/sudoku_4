class Game
  attr_reader :stdin, :stdout, :board 

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
    @board = Board.new(stdin, stdout)
  end

  def printroduction
    board.print
  end

  def prompt_for_input
    stdout.puts "\n\nPress enter to fill the next cell"
    stdin.gets
  end
 
  def auto_take_turn
    prompt_for_input
    board.fill_empty_cell
    board.print
  end

  def turns
    while !board.full?
      auto_take_turn
    end
  end

  def run
    printroduction
    turns
  end
end


