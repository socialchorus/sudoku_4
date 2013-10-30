require 'spec_helper'

describe Board do
  let(:board) {Board.new(stdin, stdout)}
  let(:stdin) {double("stdin")}
  let(:stdout) {double("stdout")}

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
        board.value_at(15).should == 2
      end
    end
  end

  describe "#full?" do 
    context 'when every cell has a non-nil value' do
      it 'should return true' do
        Cell.any_instance.stub(:value).and_return(3)  
        board.full?.should == true
      end
    end

    context 'when any cell has a nil value' do
      it 'should be false' do
        Cell.any_instance.stub(:value).and_return(3)
        board.cells[15].stub(:value).and_return(nil)
        board.full?.should == false        
      end
    end
  end
  
  describe "#get_empty_cell" do
    before do
      Cell.any_instance.stub(:value).and_return(3)
    end

    context 'there are no empty cells' do
      it "returns something falsy" do
        board.get_empty_cell.should be_false
      end
    end

    context "there is an empty cell" do
      it "returns that cell" do
        board.cells[2].stub(:value).and_return(nil)
        board.get_empty_cell.should == board.cells[2]
      end
    end
  end

  describe "#fill_empty_cell" do
    before do
      Cell.any_instance.stub(:value).and_return(3)
      board.cells[2].stub(value: nil)
    end

    context 'there is an empty cell' do
      it 'should generate a value for that cell' do
        board.cells[2].stub(:generate_value).and_return(4)
        board.fill_empty_cell.should == 4
      end
    end
  end

  describe '#values' do # TODO, WTF? include?
    context 'when there are values on the board' do
      before do
        Cell.any_instance.stub(:value).exactly(16).times        
      end
      it 'returns all values on the board' do
        board.values.should_not be_empty 
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
      Printer.should_receive(:new).with(board, stdout).and_return(printer)
      board.print
    end

    it 'should send print to the printer instance' do 
      printer.should_receive(:print)
      board.print
    end
  end

  # describe '#valid?' do
  #   context 'when row, column, and group are all valid' do
  #   end

  #   context 'when any of row, column, or group are invalid' do
  #     before do
  #       board.stub(:row_valid?).and_return(true)
  #       board.stub(:column_valid?).and_return(false)
  #       board.stub(:group_valid?).and_return(true)
  #     end
  #   end

  #   # context 'the row is invalid'
  #   # context 'the row is valid'
  #   # context 'the column is invalid'
  #   # context 'the column is valid'    
  #   # context 'the group is invalid'
  #   # context 'the group is valid'

  # end
end