require 'spec_helper'

describe Cell do
  let(:cell) { Cell.new(1) }

  describe "#initialize" do
    context "when we initialize a cell" do
      it "should store its id" do
        cell.id.should == 1
      end

      it "value is nil" do
        cell.value.should == nil
      end

      xit "group number is stored" do

      end

      xit "row number is stored" do

      end

      xit "column number is stored" do

      end 
    end
  end

  describe "#generate_value" do
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