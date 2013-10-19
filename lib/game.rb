
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
      puts 'got past the gets'
      board.fill_next_cell
      board.print 
    end
  end
end