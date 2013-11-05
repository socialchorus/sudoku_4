require 'spec_helper'

describe Validator do
  let(:collection) {double('collection')}
  let(:board_size) {4}
  let(:validator) {Validator.new(collection, board_size)}

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

    context 'all but the first element are nil' do
      let(:collection) {[1,nil,nil,nil]}
      it 'should be valid' do
        validator.should be_valid
      end
    end

    context 'all elements are nil' do
      let(:collection) {[nil,nil,nil,nil]}
      it 'should be valid' do
        validator.should be_valid
      end
    end

    context 'nils and valid numbers' do
      let(:collection) {[1,nil,4,nil]}
      it 'should be valid' do
        validator.should be_valid
      end
    end

    context 'the collection is more than 4 elements' do
      let(:collection) {[1,2,3,4,nil]}
      it 'should be invalid' do
        validator.should_not be_valid
      end
    end
  end
end