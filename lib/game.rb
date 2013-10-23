class Game
  attr_reader :stdin, :stdout, :board

  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
    @board = Board.new(stdin, stdout)
  end

  def run
    board.print

    while !board.full?
      stdout.puts "Press enter to fill the next cell"
      stdin.gets
      board.fill_empty_cell
      board.print
    end
  end
end