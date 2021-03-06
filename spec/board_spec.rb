require 'spec_helper'

describe Board do
  let(:board) {Board.new(stdin, stdout)}
  let(:stdin) {double("stdin")}
  let(:stdout) {double("stdout")}

  describe '#initialize' do
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

  describe "#full?" do
    context 'when every cell has a non-nil value' do
      it 'should return true' do
        Cell.any_instance.stub(:value).and_return(3)
        board.full?.should == true
      end
    end

    context 'when any cell has a nil value' do
      it 'should be false' do
        board.set_value(0, 3)
        board.set_value(1, nil)
        board.full?.should == false
      end
    end
  end

  describe '#valid?' do
    let(:validator) {
      double("validator", {
        valid?: true
      })
    }

    before do
      CollectionManager.stub(:new).and_return(validator)
    end

    context 'the board is valid' do
      it 'is valid' do
        board.should be_valid
      end
    end

    context 'the board has one invalid cell' do
      it 'is false' do
        counter = 0
        validator.stub(:valid?) do
          counter += 1
          counter <= 11
        end
        board.should_not be_valid
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

  describe "#value_at" do
    context 'when cell value is nil' do
      it 'value should equal space' do
        board.cells[3].value = nil
        board.value_at(3).should == " "
      end
    end

    context 'when cell value is a number' do
      it 'value should equal that number' do
        board.cells[15].value = 2
        board.value_at(15).should == 2
      end
    end
  end

  describe '#values' do
    context 'when there are values on the board' do
      before do
        Cell.any_instance.stub(:value).and_return(3)
      end

      it 'returns all values on the board' do
        board.values.should == Array.new(16,3)
      end
    end

    context 'when there arent values on the board' do
      before do
        Cell.any_instance.stub(:value).and_return(nil)
      end

      it 'returns all values on the board' do
        board.values.should == []
      end
    end

    context 'when there are some nil and some values on the board' do
      before do
        board.set_value(0,1)
        board.set_value(1,2)
        board.set_value(2,nil)
        board.set_value(3,4)
      end

      it 'board values should contain only numbers' do
        board.values.should == [1,2,4]
      end
    end
  end

  describe '#set_value' do
    it 'set the value at given index' do
      board.cells[3].value = nil
      board.set_value(3,4)
      board.value_at(3).should == 4
    end
  end

  describe '#clear_row' do
    context 'when the board is empty' do
      it 'does not clear any rows' do
        board.clear_row
        board.values.should be_empty
      end
    end

    context 'when the board is half full' do
      it 'resets all the cell values in a specified row' do
        board.cells[0..7].each { |cell| cell.value = 2 }
        board.clear_row
        board.cells[3].value.should == 2
        board.cells[4].value.should == nil
        board.cells[7].value.should == nil
      end
    end
  end

  describe '#fill_empty_row' do
    context 'there is an empty row' do
      let(:incomplete_board) {
        {
          0 => 1, 1 => 4, 2 => 3, 3 => 2,
          4 => nil, 5 => nil, 6 => nil, 7 => nil,
          8 => nil, 9 => nil, 10 => nil, 11 => nil,
          12 => nil, 13 => nil, 14 => nil, 15 => nil
        }
      }

      before do
        incomplete_board.each do |index, value|
          board.set_value(index, value)
        end
      end

      it 'should generate values for that row' do
        board.fill_empty_row
        board.value_at(4).should_not == " "
        board.value_at(7).should_not == " "
      end
    end
  end
end