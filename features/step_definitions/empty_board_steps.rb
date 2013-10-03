Given(/^I have started the game$/) do
	@output = `ruby sudoku.rb` 
end

Then(/^I will see an empty board$/) do
  @output.should_not match /\d/	
  @output.should match /\D/ # express the regexp above with the code you wish you had
end

	# we create a board class and the initialize method creates a 
	# 4x4 board that is empty
	# there are 16 objects... 

#assert some output
#no numbers
