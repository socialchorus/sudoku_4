require 'spec_helper'

describe Board do
  let(:board) {Board.new}

  context 'when we initialize a board' do
    it 'should have cells' do
      board.cells.should_not == nil
    end

    it 'should have 16 cells' do
      board.cells.count.should == 16
    end

    it 'should print something' do
      board.print.should == true
    end
  end

  context 'when cells value is nil' do
    it 'should give a space' do
      board.value_at.id.should == " "
      end
    end
  end
end