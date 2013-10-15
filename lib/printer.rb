class Printer
  attr_accessor :board, :template

  def initialize(board)
    @board = board
    @template = File.open('lib/template.txt').read
  end

  def matched_patterns
    template.scan(/\{\{\d+\}\}/)
  end

  def render_board_template
    matched_patterns.each do |pattern|
      num = pattern.scan(/\d+/).first.to_i
      template.sub!(pattern, board.value_at(num).to_s)
    end
  end

  def print
    render_board_template
    put_string template
  end
  
  def put_string str
    $stdout.puts str 
  end
end