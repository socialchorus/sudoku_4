# require 'erb'. erb should be built-in, so i don't think we have to add it to Gemfile

class Printer
  attr_accessor :template, :board, :cells #needs cells, and values from cells
  # This board needs the file, the presenter.
  def initialize(board)
    @template = File.open("lib/template.txt")
    @board = board
  end

  # Hash_creator creates a hash from the array of values.
  # This will be used to call each number.
  def board_hash_creator
    # board_hash = Hash.new[(0...cells.size).zip cells]
  end

  def board_presenter
    template.send(board_hash_creator)

  end

  def print
    puts template.board_presenter
  end
end
