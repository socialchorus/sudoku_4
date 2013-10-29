require 'spec_helper'

describe Game do
  let(:game) {Game.new(stdin, stdout)}
  let(:board) {double("board")}
  let(:stdin) {double("stdin")}
  let(:stdout) {double("stdout")}

  before do
    Board.stub(:new).and_return(board)
  end

  describe '#initialize' do
    context 'when we initialize a board' do
      it 'makes a new board' do
        Board.should_receive(:new).with(stdin, stdout).and_return(board)
        game.board.should == board
      end
    end
  end  

  describe '#printroduction' do
    it 'prints the empty board' do 
      board.should_receive(:print)
      game.printroduction
    end
  end

  describe '#valid?' do
    context 'board is valid' do
      it 'checks validity of board' do
        board.should_receive(:valid?).and_return(true)
        game.valid?
      end
    end

    context 'board is invalid' do
      it 'checks validity of board' do
        board.should_receive(:valid?).and_return(false)
        game.valid?
      end
    end
  end

  describe '#auto_take_turn' do
    before do
      board.stub(:fill_empty_cell)
      board.stub(:print)
      stdin.stub(:gets)
      stdout.stub(:puts)
    end

    it 'prompts for input' do 
      stdout.should_receive(:puts).with(an_instance_of(String))
      game.auto_take_turn
    end

    it 'waits for input' do 
      stdin.should_receive(:gets)
      game.auto_take_turn
    end

    it 'tells the board to fill an empty cell' do
      board.should_receive(:fill_empty_cell)
      game.auto_take_turn
    end

    it 'tells the board to print' do
      board.should_receive(:print)
      game.auto_take_turn
    end

    it 'checks the validity of the board numbers' do
      game.valid?.should_not == nil
    end
  end

  describe '#take_turn' do
    before do
      board.stub(:index)
      board.stub(:print)
      stdin.stub(:gets)
      stdout.stub(:puts)
    end

    it 'prompts user to input index' do
      stdout.should_receive(:puts).with(an_instance_of(String))
      game.take_turn
    end

    it 'prompt user to input value (1-4)' do
      stdin.should_receive(:gets).with(an_instance_of(String))
      game.take_turn
    end

    it 'tells the board users index and value inputs' do
      board.should_receive(:index)
      board.should_receive(:value) # TODO see if should_receive can take two arguments
      game.take_turn
    end

    it 'fills the board according to the users input' 

    it 'tells the board to print' do
      board.should_receive(:print)
      game.take_turn
    end

    it 'checks the validity of the board numbers' do
      game.valid?.should_not == nil
    end
  end

  describe '#values' do
    it 'returns the values on the board' do
      board.should_receive(:values).and_return(an_instance_of(Array))
      game.values
    end
  end

  describe '#run' do
    before do
      board.stub(:full?).and_return(true)
      game.stub(:printroduction)
    end

    it 'printroductions itself' do
      game.should_receive(:printroduction)
      game.run
    end

    it 'takes turns while board is not full' do
      counter = 0
      board.stub(:full?) do
        counter += 1
        if counter <= 3
          false
        else
          true
        end
      end

      game.should_receive(:auto_take_turn).exactly(3).times
      game.run
    end 
  end

  describe '#board_invalid' do
    it 'puts an error message' do
      stdout.should_receive(:puts).with(an_instance_of(String))
      game.board_invalid
    end

    it 'generates a new board' do
      Board.should_receive(:new).with(stdin, stdout).and_return(board)
      game.board.should == board
      game.board_invalid
    end
  end
end