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
      board.cells[2].stub(:value).and_return(nil)
    end

    context 'there is an empty cell' do
      it 'should generate a value for that cell' do
        board.cells[2].stub(:generate_value).and_return(4)
        board.fill_empty_cell.should == 4
      end
    end
  end

  describe '#values' do 
    context 'when there are values on the board' do
      before do
        Cell.any_instance.stub(:value).and_return(3)
      end

      it 'returns all values on the board' do
        board.values.should_not be_empty
        board.values.should include(3) 
      end
    end

    context 'when there arent values on the board' do
      before do
        Cell.any_instance.stub(:value).and_return(nil)
      end

      it 'returns all values on the board' do
        board.values.should be_empty
        board.values.should_not include(3) 
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

  describe '#valid?' do
    context 'when rows, columns, and groups are all valid' do
      before do
        board.stub(:rows_valid?).and_return(true)
        board.stub(:columns_valid?).and_return(true)
        board.stub(:groups_valid?).and_return(true)
      end

      it 'valid should be true' do
        board.should be_valid
      end
    end

    context 'when any rows, columns, or groups are invalid' do
      before do
        board.stub(:rows_valid?).and_return(true)
        board.stub(:columns_valid?).and_return(false)
        board.stub(:groups_valid?).and_return(true)
      end

      it 'valid should be false' do
        board.should_not be_valid
      end
    end

    context 'when rows, columns, and groups are all invalid' do
      before do
        board.stub(:rows_valid?).and_return(false)
        board.stub(:columns_valid?).and_return(false)
        board.stub(:groups_valid?).and_return(false)
      end

      it 'valid should be false' do
        board.should_not be_valid
      end
    end    

    # context 'rows is invalid'
    # context 'columns is invalid'  
    # context 'groups is invalid'  
  end

  describe '#rows_valid?' do
    before do
      Cell.any_instance.stub(:value)
      Cell.any_instance.stub(:row)
    end

    context 'when all rows are valid' do
      before do

      end

      it 'row one is valid' do
        row = nil
        value = nil
        board.cells[0..3].each do |cell|
          row = cell.stub(:row).and_return(1)
          value = cell.stub(:value).and_return(val)
        end

        

        # contains one each of 1,2,3,4
      end

      it 'row two is valid' 
        # contains one each of 1,2,3,4     
      it 'row three is valid'   
        # contains one each of 1,2,3,4    
      it 'row four is valid'
        # contains one each of 1,2,3,4  
      it 'is valid'
    end

    # context 'when any rows are invalid' do
    #   it '' do
    #   end
    # end
  end

  # describe '#columns_valid?' do
  # end

  # describe '#groups_valid?' do
  # end
end