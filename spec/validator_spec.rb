require 'spec_helper'

describe Validator do
  let(:collection) {double('collection')}
  let(:board_size) {4}
  let(:validator) {Validator.new(collection, board_size)}


  describe '#initialize' do
    it 'should store a collection' do
      validator.collection.should == collection
    end
  end

  describe '#valid?' do
    context 'a collection has all valid numbers' do
      let(:collection) {[1,2,3,4]}
      it 'should be valid' do
        validator.should be_valid
      end
    end
    
    context 'a collection has duplicate numbers' do
      let(:collection) {[1,2,3,3]}
      it 'should not be valid' do
        validator.should_not be_valid
      end
    end

    context 'a collection has an illegal number' do
      let(:collection) {[1,2,33,3]}
      it 'should not be valid' do
        validator.should_not be_valid
      end
    end

    context 'nil' do

    end
  end
end