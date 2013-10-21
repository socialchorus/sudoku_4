require 'spec_helper'

describe Board do
  let(:board) {Board.new($stdin, $stdout)}

  describe "#initialize" do
    context 'when we initialize a board' do
      it 'cells collection should have a length of 16' do
        board.cells.count.should == 16
      end

      it 'cells collection contains cells' do
        board.cells.each do |cell|
          cell.is_a?(Cell).should == true
        end
      end
    end
  end

  describe "#value_at" do
    context 'when cell value is nil' do
      it 'value should equal space' do
        Cell.any_instance.stub(:value).and_return(nil)
        board.value_at(3).should == " "
      end
    end

    context 'when cell value is a number' do
      it 'value should equal that number' do
        Cell.any_instance.stub(:value).and_return(2)
        board.value_at(3).should == 2
      end
    end
  end
  
  describe "#print" do 
    let(:printer) {double("printer")}
    
    before do
      Printer.stub(:new).and_return(printer)
      printer.stub(:print)
    end

    it 'makes a new printer' do
      Printer.should_receive(:new).with(board, $stdout).and_return(printer)
      board.print
    end

    it 'should send print to the printer instance' do 
      printer.should_receive(:print)
      board.print
    end
  end
end