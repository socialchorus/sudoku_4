class Printer
  attr_accessor :board, :template

  def initialize(board)
    @template = File.open("lib/template.txt").read
    @board = board
  end

  def pattern_extractor
    template.scan(/\{\{\d+\}\}/) 
  end

  def render_board_template
    pattern_extractor.each do |pattern|
      num = pattern.scan(/\d+/).first
      template.sub!(pattern, board.value_at(num.to_i).to_s) 
    end
    puts template
  end


  def print
    render_board_template
    puts board.value_at(2)
    puts board.value_at(3)
    puts board.value_at(4)

  end

end