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

  describe '#take_turn' do
    before do
      board.stub(:fill_empty_cell)
      board.stub(:print)
      stdin.stub(:gets)
      stdout.stub(:puts)
    end

    it 'prompts for input' do 
      stdout.should_receive(:puts).with(an_instance_of(String))
      game.take_turn
    end

    it 'waits for input' do 
      stdin.should_receive(:gets)
      game.take_turn
    end

    it 'tells the board to fill an empty cell' do
      board.should_receive(:fill_empty_cell)
      game.take_turn
    end

    it 'tells the board to print' do
      board.should_receive(:print)
      game.take_turn
    end

    it 'checks the validity of the board numbers'
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
      game.should_receive(:take_turn).exactly(3).times
      game.run
    end 
  end 

  describe '#board_numbers_valid?' do
    it 'returns true if the board is valid'
    it 'returns false if the board is invalid'
  end

  describe '#board_invalid_error' do
    it 'puts an error message'
  end

  describe '#create_new_board' do
    it 'generates a new board'
  end
end


