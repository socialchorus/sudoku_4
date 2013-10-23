class Game
  attr_reader :stdin, :stdout, :board

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
    @board = Board.new(stdin, stdout)
  end

  def run
    printroduction

    while !board.full?
      take_turn
    end
  end

  def prompt_for_input
    stdout.puts "Press enter to fill the next cell"
    stdin.gets
  end
 
  def take_turn
    prompt_for_input
    board.fill_empty_cell
    board.print
  end

  def printroduction
    board.print
  end
end