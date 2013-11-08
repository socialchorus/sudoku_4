require 'spec_helper'

describe CollectionManager do
  let(:collection) {[make_cell(1), make_cell(2), make_cell(3), make_cell(4)]}
  let(:board_size) {4}
  let(:collection_manager) {CollectionManager.new(collection, board_size)}

  describe '#clear' do
    context 'collection is already empty' do
      let(:collection) {[make_cell(nil), make_cell(nil), make_cell(nil), make_cell(nil)]}

      it 'does nothing' do
        collection.each do |cell|
          cell.should_receive(:value=).with(nil)
        end
        collection_manager.clear
      end
    end

    context 'collection is half full or half empty, depending on your mood' do
      let(:collection) {[make_cell(1), make_cell(2), make_cell(nil), make_cell(nil)]}

      it 'clears collection values' do
        collection.each do |cell|
          cell.should_receive(:value=).with(nil)
        end
        collection_manager.clear
      end
    end

    context 'collection is full' do
      let(:collection) {[make_cell(1), make_cell(2), make_cell(3), make_cell(4)]}

      it 'clears collection values' do
        collection.each do |cell|
          cell.should_receive(:value=).with(nil)
        end
        collection_manager.clear
      end
    end
  end

  describe '#generate_values' do
    context 'the collection already has values' do
      it 'generates legal values for a collection' do # TODO how to make sure only generating valid row?
        collection.each do |cell|
          cell.should_receive(:value=).with(an_instance_of(Fixnum))
        end
        collection_manager.generate_values
      end
    end

    context 'the collection has no values' do
      it 'generates legal values for a collection' do
        collection.each do |cell|
          cell.should_receive(:value=).with(an_instance_of(Fixnum))
        end
        collection_manager.generate_values
      end
    end
  end

  describe '#empty?' do
    before do
      collection.each { |cell| cell.stub(:empty?) }
    end

    context 'collection contains two items' do
      let(:collection) {[make_cell(1), make_cell(2), make_cell(nil), make_cell(nil)]}

      it 'is not empty' do
        collection[0].stub(:empty?).and_return(false)
        collection[1].stub(:empty?).and_return(false)
        collection[2].stub(:empty?).and_return(true)
        collection[3].stub(:empty?).and_return(true)
        collection_manager.should_not be_empty
      end
    end

    context 'collection is full' do
      it 'is not empty' do
        collection.each { |cell| cell.stub(:empty?).and_return(false) }
        collection_manager.should_not be_empty
      end
    end

    context 'collection is empty' do
      it 'is empty' do
        collection.each { |cell| cell.stub(:empty?).and_return(true) }
        collection_manager.should be_empty
      end
    end
  end

  describe '#valid?' do
    context 'a collection has all valid numbers' do
      it 'should be valid' do
        collection_manager.should be_valid
      end
    end

    context 'a collection has duplicate numbers' do
      let(:collection) {[make_cell(1), make_cell(2), make_cell(3), make_cell(3)]}
      it 'should not be valid' do
        collection_manager.should_not be_valid
      end
    end

    context 'a collection has an illegal number' do
      let(:collection) {[make_cell(1), make_cell(2), make_cell(33), make_cell(4)]}
      it 'should not be valid' do
        collection_manager.should_not be_valid
      end
    end

    context 'all but the first element are nil' do
      let(:collection) {[make_cell(1), make_cell(nil), make_cell(nil), make_cell(nil)]}
      it 'should be valid' do
        collection_manager.should be_valid
      end
    end

    context 'all elements are nil' do
      let(:collection) {[make_cell(nil), make_cell(nil), make_cell(nil), make_cell(nil)]}
      it 'should be valid' do
        collection_manager.should be_valid
      end
    end

    context 'nils and valid numbers' do
      let(:collection) {[make_cell(1), make_cell(nil), make_cell(4), make_cell(nil)]}
      it 'should be valid' do
        collection_manager.should be_valid
      end
    end

    context 'the collection is more than 4 elements' do
      let(:collection) {[make_cell(1), make_cell(2), make_cell(3), make_cell(4), make_cell(nil)]}
      it 'should be invalid' do
        collection_manager.should_not be_valid
      end
    end
  end
end