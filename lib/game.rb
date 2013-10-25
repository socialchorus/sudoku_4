class Game
  attr_reader :stdin, :stdout, :board 
  attr_accessor :turns_taken

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
    @board = Board.new(stdin, stdout)
    @turns_taken = 0
  end

  def printroduction
    board.print
  end

  def prompt_for_input
    stdout.puts "\n\nPress enter to fill the next cell"
    stdin.gets
  end
 
  def take_turn
    prompt_for_input
    board.fill_empty_cell
    board.print
    self.turns_taken += 1
  end

  def turns
    while !board.full?
      take_turn
    end
  end

  def run
    printroduction
    turns
  end
end


