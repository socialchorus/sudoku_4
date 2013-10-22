Given(/^I have started the game$/) do
  @input = StringIO.new("")
  @output = StringIO.new("")
  @boards = []
  Game.new(@input, @output).run
end

Then(/^I will see an empty board$/) do
  @output.rewind
  @output.read.should match(/\|/)
  @output.rewind
  @boards << @output.read
  @split_boards = @boards[0].split "Press enter to fill the next cell\n"
  @split_boards[0].scan(/\d+/).count.should eql 0  
end

Then(/^I will see (\d+) boards with cells populately consecutively with numbers between (\d+) and (\d+)$/) do |arg1, arg2, arg3|
  count = 0
  @split_boards.each do |board|
    numbers = board.scan(/\d+/)
    numbers.count.should eql count
    count += 1
  end
end