require 'spec_helper'

describe Cell do
  let(:cell) { Cell.new(1) }

  context "when we initialize a cell" do
    it "value is nil" do
      cell.value.should == nil
    end
  end

  it "should store its id" do
    cell.id.should == 1
  end  
end