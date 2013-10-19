

Given(/^I have started the game$/) do
  @input = StringIO.new("")
  @output = StringIO.new("")
  Game.new(@input, @output).run 
end

# Then(/^I will see an empty board$/) do
#   @output.should_not match /\d/ 
#   @output.should match /\|/
# end




Steps for number replacement on template:
# Read board

# Gets matching patterns 
        # "hello".gsub(/(?<foo>[aeiou])/, '{\k<foo>}')  #=> "h{e}ll{o}"
    # puts template.gsub(/?<foo>[pattern_extractor]/, '\k<foo>value_att(pattern_extractor)')
    # {|digit| do board.value_at(digit).to_s} 
    # template.render ?? value_at ??
# Extracts the number
# Render / sticks it back in
# Print







((\s_{3}\s_{3}\s){2}((\|(\s){3}\|(\s){3}\|){2}\s(\|_{3}\|_{3}\|){2}\s){2}){2} #This is the one we're using

((\s+_{3}){4}\s((\|+\s{3}){4}\|\s(\|+_{3}){4}\|\s){2}){2} #This one also works.


(\s_{3}\s_{3}\s_{3}){2}

(\|+\s{3}){9}\| #If we desire to make this a 9x9, this is the pattern for the test.



(\|+\s{3})
(\|+\s+\s+\s)
(((\|+\s{3})){2}.*){4}

(((\|+\s{3})){4}(\s|\||_)*){4} #It works, but... it's not pretty.

(((\|+\s{3}))(.*))

(\s_{3}\s_{3}\s){2}(\|+\s{3}){4}\|\s (works for two rows, but \s?)


i + 1 % 4/n

 ___ ___  ___ ___
|   |   ||   |   |
|___|___||___|___|
|   |   ||   |   |
|___|___||___|___|
 ___ ___  ___ ___
|   |   ||   |   |
|___|___||___|___|
|   |   ||   |   |
|___|___||___|___|


(( ___ ___ ){2}+((|   |   |){2}(|___|___|){2}){2}){2}

((topper)2+((second)2+(butt)2)2)2


 (___ ___  ___ ___ /n|   |   ||   |   |/n|___|___||___|___|/n|   |   ||   |   |/n|___|___||___|___| /n)2
 # do you include line breaks with regular expressions?

 

 ___ ___  ___ ___ |   |   ||   |   ||___|___||___|___||   |   ||   |   ||___|___||___|___|
 ___ ___  ___ ___ |   |   ||   |   ||___|___||___|___||   |   ||   |   ||___|___||___|___|




 ___ ___  ___ ___
|   |   ||   |   |
|___|___||___|___|
|   |   ||   |   |
|   |   ||   |   |
==================
|   |   ||   |   |
|___|___||___|___|
|   |   ||   |   |
|___|___||___|___|

 ___ ___  ___ ___
|   |   ||   |   |
|___|___||___|___|
|   |   ||   |   |
|===|===||===|===|
|   |   ||   |   |
|___|___||___|___|
|   |   ||   |   |
|___|___||___|___|

 ___ ___ ___ ___
|   |   *   |   |
|___|___*___|___|
|   |   *   |   |
|   |   *   |   |
* * * * * * * * * 
|   |   *   |   |
|___|___*___|___|
|   |   *   |   |
|___|___*___|___|


 ___ ___  ___ ___ 
|   |   ||   |   |
|___|___||___|___|
|   |   ||   |   |
|___|___||___|___|
 ___ ___  ___ ___
|   |   ||   |   |
|___|___||___|___|
|   |   ||   |   |
|___|___||___|___|
