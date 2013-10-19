Given(/^I have started the game$/) do
  @input = StringIO.new('')
  @output = StringIO.new("")
  @boards = []
  Game.new(@input, @output).run
end

Then(/^I will see an empty board$/) do
  @output.rewind
  @output.read.should match /\|/
end

When(/^I press enter$/) do
  @output.string = ""
  @input.puts "/n" 
  @output.rewind
  @boards << @output.read 
end

Then(/^I will see (\d+) boards with cells populately consecutively with numbers between (\d+) and (\d+)$/) do |arg1, arg2, arg3|
  puts @boards.inspect
end