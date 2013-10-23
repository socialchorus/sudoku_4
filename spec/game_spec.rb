require 'spec_helper'

describe Game do
  let(:game) {Game.new($stdin, $stdout)}
  let(:board) {double("board")}

  describe '#initialize' do
    context 'when we initialize a board' do
      it 'makes a new board' do
        Board.stub(:new).with($stdin, $stdout).and_return(board)
      end
    end
  end  

  describe '#run' do
    before do
      Board.stub(:new).and_return(board)
      board.stub(:print)
    end
    context 'while the board is not full' do
      it 'send board a message to fill a cell' do
        Board.stub(:print).and_return(board)
        game.run
      end

      it 'should send print to the board instance' do 
        board.should_receive(:print)
        game.run
      end
    end
  end 
end