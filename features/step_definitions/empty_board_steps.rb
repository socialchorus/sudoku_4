Given(/^I have started the game$/) do
  @output = `ruby sudoku.rb` 
  puts @output.inspect
end

Then(/^I will see an empty board$/) do
  @output.should_not match /\d/ 
  @output.should match /\|/
# That regular expression should exactly match our board. 
#It checks that it generated correctly and checks that it's a 4x4.
end

  # we create a board class and the initialize method creates a 
  # 4x4 board that is empty
  # there are 16 objects... 

#assert some output
#no numbers
