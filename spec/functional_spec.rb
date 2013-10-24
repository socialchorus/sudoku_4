require 'spec_helper'

describe Game do
  let(:game) {Game.new(stdin, stdout)}

  describe 'user starts the game' do
    it 'prints an empty board' 
    describe 'the first turn' do
      it 'enters a value into the first cell'
      it 'prints the board'
    end     

    describe 'subsequent turns' do
      it 'takes a turn'
    end
  end

  context 'the board values are valid' do
    it 'continues to take turn'
  end
  
  context 'the board values are invalid' do
    it 'generates an error' 

    it 'generates a new board' 

    it 'takes a turn'
  end
end
