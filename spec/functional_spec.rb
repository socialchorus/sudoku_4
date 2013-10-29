require 'spec_helper'

describe Game do
  let(:game) {Game.new(input, output)}
  let(:input) {StringIO.new("")}
  let(:output) {StringIO.new("")}

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
      game.auto_take_turn
    end

    it 'a value is entered into an empty cell' do
      read_output.scan(/\d+/).count.should == 1 
    end

    it 'prints the board' do
      read_output.should =~ /\|/
    end

    it 'board should be valid' do
      game.should be_valid
    end
  end

  describe 'other turns' do

    before do
      game.auto_take_turn
    end
    
    context 'whether or not board is valid' do
      before do
        output.string = ""
        game.auto_take_turn
      end

      it 'a value is entered into an empty cell' do
        read_output.scan(/\d+/).count.should == 2
      end

      it 'prints the board' do
        read_output.should =~ /\|/
      end
    end

    context 'the board values are valid' do
      let(:index) {1}
      let(:value) do 
        if game.values.first != 4
          value += 1
        else
          1
        end
      end

      before do
        output.string = ""
        game.take_turn(index, value)
      end

      it 'doesnt print an error message' do
        read_output.should_not include("invalid")
      end

      it 'doesnt clear the board' do
        read_output.should =~ /\d+/
        puts read_output
      end
    end
    
    context 'the board values are invalid' do
      let(:index) {1}
      let(:value) {game.values.first}

      before do
        output.string = ""
        game.take_turn(index, value)
      end

      it 'prints an error message' do
        read_output.should include("invalid")
      end

      it 'clears the board' do
        read_output.should_not =~ /\d+/
      end
    end
  end

  describe 'all turns taken' do
    let(:last_board) {split_boards.last}
    let(:last_board_values) {last_board.scan(/\d+/)}
    before do
      game.run
    end

    it 'board is valid' do
      output_numbers = last_board_values.map do |value|
        value.to_i
      end 
      game.valid?.should == true
      game.values == output_numbers
    end

    it 'board should be full' do
      last_board_values.count.should == 16
    end

    it 'displays board complete message' do
      last_board.should include("complete")
    end
  end
end