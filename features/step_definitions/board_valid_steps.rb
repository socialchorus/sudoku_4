Given(/^that I start the game$/) do
  @input = StringIO.new("")
  @output = StringIO.new("")
  @boards = []
  Game.new(@input, @output).run
end

Then(/^I will eventually see a valid board$/) do
  @output.rewind
  @boards << @output.read
  @split_boards = @boards[0].split "Press enter to fill the next cell\n"
  @split_boards[16].scan(/\d+/).count.should == 16
  @split_boards[16].scan(/\d+/).valid?.should == true 
end

