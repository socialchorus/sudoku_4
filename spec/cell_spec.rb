require 'spec_helper'

describe Cell do
  let(:board_size) {4}
  let(:cell) { Cell.new(0, board_size) }

  describe "#initialize" do
    context "when we initialize a cell" do
      it "should store its id" do
        cell.id.should == 0
      end

      it "value is nil" do
        cell.value.should == nil
      end

      describe 'row is calculated' do
        it "row is calculated for the 1st cell" do
          cell.row.should == 1
        end

        it "row is calculated for the 4th cell" do
          cell = Cell.new(3, board_size)
          cell.row.should == 1
        end

        it "row is calculated for the 5th cell" do
          cell = Cell.new(4, board_size)
          cell.row.should == 2
        end
      end

      describe 'column is calculated' do
        it "column is calculated for 1st cell" do
          cell = Cell.new(4, board_size)
          cell.column.should == 1
        end

        it "column is calculated for the 12th cell" do
          cell = Cell.new(11, board_size)
          cell.column.should == 4
        end
      end

      describe 'group is calculated' do
        it "group is calculated for the 6th cell" do
          cell = Cell.new(5, board_size)
          cell.group.should == 1
        end

        it "group is calculated for the 7th cell" do
          cell = Cell.new(6, board_size)
          cell.group.should == 2
        end

        it "group is calculated for the 10th cell" do
          cell = Cell.new(9, board_size)
          cell.group.should == 3
        end

        it "group is calculated for the 11th cell" do
          cell = Cell.new(10, board_size)
          cell.group.should == 4
        end
      end
    end
  end

  describe "#generate_value" do # TODO completely rewrite this to accomodate row-by-row completion
    it 'assigns the instance of cell a value between 1 and 4' do
      cell.generate_value  
      cell.value.should be_instance_of(Fixnum)
      cell.value.should <= 4 && cell.value.should >= 1
    end
  end

  describe '#empty?' do
    context 'the cell has a nil value' do
      it 'should return true' do
        cell.empty? == true
      end
    end

    context 'the cell has a numeric value' do
      it 'should return false' do
        cell.value = 1
        cell.empty? == false
      end
    end
  end
end