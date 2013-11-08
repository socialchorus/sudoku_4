Given(/^that I start the game$/) do
  @input = StringIO.new("")
  @output = StringIO.new("")
  @game = Game.new(@input, @output)
  @game.run
end

Then(/^I will eventually see a valid board$/) do
  last_board = split_boards(@output).last
  last_board_values = last_board.scan(/\d+/)
  last_board_values.count.should == 16
  output_numbers = last_board_values.map do |value|
    value.to_i
  end
  @game.valid?.should == true
  @game.values == output_numbers
end

