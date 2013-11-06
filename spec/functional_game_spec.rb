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

  describe 'generating the first row' do 
    before do
      game.auto_fill_row
    end

    it 'values are entered into the top empty row' do 
      read_output.scan(/\d+/).count.should == 4
    end

    it 'prints the board' do
      read_output.should =~ /\|/
    end

    it 'board should be valid' do
      game.should be_valid
    end
  end

  describe 'generating other rows' do
    before do
      game.auto_fill_row
    end
    
    context 'whether or not board is valid' do
      before do
        output.string = ""
        game.auto_fill_row
      end

      it 'values are entered into an empty row' do 
        read_output.scan(/\d+/).count.should == 8
      end

      it 'prints the board' do
        read_output.should =~ /\|/
      end
    end

    context 'the board values are valid' do
      let(:second_row_values) {game.values.reverse}
      let(:second_row_indexes) {[4,5,6,7]}
      let(:second_row) {Hash[second_row_indexes.zip second_row_values]}

      before do 
        output.string = ""
        second_row.each do |index, value|
          game.set_value(index, value)
        end
        game.print
        game.handle_invalid_board #TODO weird to completely stage this?
      end

      it 'doesnt print an error message' do
        read_output.should_not include("invalid")
      end

      it 'doesnt clear the board' do
        game.values.should_not be_empty
      end
    end
    
    context 'the board values are invalid' do #TODO, stub it out

      before do 
        output.string = ""
        second_row.each do |index, value|
          game.set_value(index, value)
        end
        game.print
        game.handle_invalid_board #TODO weird to completely stage this?
      end

      it 'prints an error message' do
        read_output.should include("invalid")
      end

      it 'clears the row' do
        game.values.count.should == 4
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