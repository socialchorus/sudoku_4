require 'spec_helper'

describe Game do
  let(:game) {Game.new(input, output)}
  let(:input) {StringIO.new("")}
  let(:output) {StringIO.new("")}

  before do
    @boards = []
  end

  describe 'user starts the game' do
    before do
      game.printroduction
    end

    it 'board should be empty' do
      read_output.should_not =~ /\d+/
    end

    it 'prints a board' do
      read_output.should =~ /\|/
    end 
  end

  describe 'taking the first turn' do
    before do
      game.take_turn
    end

    it 'a value is entered into an empty cell' do
      read_output.scan(/\d+/).count.should == 1 
    end

    it 'prints the board' do
      read_output.should =~ /\|/
    end

    xit 'board should be valid' do
      game.should be_valid
    end
  end

  describe 'other turns' do
    before do
      game.take_turn 
    end

    it 'a value is entered into the next empty cell' do
      output.rewind
      @boards << output.read
      @split_boards = @boards[0].split "Press enter to fill the next cell\n"
      (0..game.turns_taken).each do |number|
        @split_boards[number].scan(/\d+/).count.should == number
      end
    end

    it 'prints the board'

    context 'the board values are valid' do
      it 'takes the next turn'
    end
    
    context 'the board values are invalid' do
      it 'prints an error message' 
      xit 'generates a new board' do
        output.string = ""

      end
      it 'takes the first turn'
    end
  end

  describe 'all turns taken' do   
    it 'board is valid'
    it 'board should be full'
    it 'displays board complete message'
  end
end
