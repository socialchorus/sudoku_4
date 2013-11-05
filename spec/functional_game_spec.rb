require 'spec_helper'

describe Game, 'functional' do
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

# TODO write tests for generating valid board
# row-by-row

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
        game.values.should_not be_empty
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
        game.values.should be_empty
      end
    end
  end

  describe '#valid?' do
    context 'when rows, columns, and groups are all valid' do
      let(:valid_board) {
        {
          0 => 1, 1 => 4, 2 => 3, 3 => 2, 
          4 => 2, 5 => 3, 6 => 4, 7 => 1, 
          8 => 3, 9 => 2, 10 => 1, 11 => 4, 
          12 => 4, 13 => 1, 14 => 2, 15 => 3
        }
      }

      before do 
        valid_board.each do |index, value|
          game.board.set_value(index,value)
        end
      end
        
      it 'should be valid' do
        game.should be_valid
      end      
    end

    context 'when one cell is invalid' do
      let(:invalid_board) {
        {
          0 => 1, 1 => 4, 2 => 3, 3 => 2, 
          4 => 2, 5 => 3, 6 => 4, 7 => 1, 
          8 => 3, 9 => 2, 10 => 1, 11 => 4, 
          12 => 4, 13 => 1, 14 => 2, 15 => 2
        }
      }

      before do 
        invalid_board.each do |index, value|
          game.board.set_value(index,value)
        end
      end
        
      it 'should be invalid' do
        game.should_not be_valid
      end      
    end

    context 'when two cells are nil, but board is valid' do
      let(:incomplete_board) {
        {
          0 => 1, 1 => nil, 2 => 3, 3 => 2, 
          4 => 2, 5 => 3, 6 => nil, 7 => 1, 
          8 => 3, 9 => 2, 10 => 1, 11 => 4, 
          12 => 4, 13 => 1, 14 => 2, 15 => 3
        }
      }

      before do 
        incomplete_board.each do |index, value|
          game.board.set_value(index,value)
        end
      end
        
      it 'should be valid' do
        game.should be_valid
      end      
    end

    context 'when a cell has an illegal value' do
      let(:illegal_board) {
        {
          0 => 1, 1 => nil, 2 => 3, 3 => 2, 
          4 => 2, 5 => 3, 6 => 333, 7 => 1, 
          8 => 3, 9 => 2, 10 => 1, 11 => 4, 
          12 => 4, 13 => 1, 14 => 2, 15 => 3
        }
      }

      before do 
        illegal_board.each do |index, value|
          game.board.set_value(index,value)
        end
      end
        
      it 'should be invalid' do
        game.should_not be_valid
      end      
    end

    context 'when boards cell values are all nil' do
      it 'should be valid' do
        game.should be_valid
      end      
    end    
  end

  describe 'all turns taken' do # TODO STUCK
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