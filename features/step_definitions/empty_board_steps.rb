

Given(/^I have started the game$/) do
  @input = StringIO.new("")
  @output = StringIO.new("")
  Game.new(@input, @output).run 
end

# Then(/^I will see an empty board$/) do
#   @output.should_not match /\d/ 
#   @output.should match /\|/
# end




