Feature: Board Displays a Valid Arrangement of Numbers
  As a puzzle addict, I want my board to only contain a valid arrangement of numbers.

  Scenario: Filling the board with a valid arrangement of numbers.
    Given that I start the game
    Then I will eventually see a valid board
