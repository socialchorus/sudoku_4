Feature: Board Displays and Fills with Random Numbers
  As an interested puzzle addict, I can see an empty board first, followed by 16 prompts to fill the board cell by cell with a random number between 1 and 4

  Scenario: Starting the game and filling the board
    Given I have started the game
    Then I will see an empty board
    When I press enter
    Then I will see 16 boards with cells populately consecutively with numbers between 1 and 4

 