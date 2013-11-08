require 'spec_helper'

describe Game do
  let(:game) {Game.new(stdin, stdout)}
  let(:board) {double("board")}
  let(:stdin) {double("stdin")}
  let(:stdout) {double("stdout")}

  before do
    Board.stub(:new).and_return(board)
  end

  describe '#initialize' do
    context 'when we initialize a board' do
      it 'makes a new board' do
        Board.should_receive(:new).with(stdin, stdout).and_return(board)
        game.board.should == board
      end
    end
  end

  describe '#valid?' do
    it 'delegates to the board' do
      board.should_receive(:valid?).and_return(true)
      game.should be_valid
    end
  end

  describe '#values' do
    it 'delegates to the board and returns an array with values' do
      board.should_receive(:values).and_return([2,3,4,1])
      game.values.should == [2,3,4,1]
    end
  end

  describe '#run' do
    before do
      board.stub(:full?).and_return(true)
      game.stub(:printroduction)
      stdout.stub(:puts)
    end

    it 'printroductions itself' do
      game.should_receive(:printroduction)
      game.run
    end

    it 'takes turns while board is not full' do
      counter = 0
      board.stub(:full?) do
        counter += 1
        if counter <= 3
          false
        else
          true
        end
      end
      game.should_receive(:auto_fill_row).exactly(3).times
      game.run
    end

    context 'when the board is complete' do
      it 'prints a board complete message' do
        stdout.should_receive(:puts)
        game.run
      end
    end
  end

  describe '#printroduction' do
    it 'prints the empty board' do
      board.should_receive(:print)
      game.printroduction
    end
  end

  describe '#auto_fill_row' do
    let(:board) {
      double('board', {
        fill_empty_row: nil,
        print: nil,
        valid?: false,
        clear_row: nil,
      })
    }

    before do
      stdin.stub(:gets)
      stdout.stub(:puts)
    end

    it 'prompts for input' do
      stdout.should_receive(:puts).with(an_instance_of(String))
      game.auto_fill_row
    end

    it 'waits for input' do
      stdin.should_receive(:gets)
      game.auto_fill_row
    end

    it 'tells the board to fill an empty row' do
      board.should_receive(:fill_empty_row)
      game.auto_fill_row
    end

    it 'tells the board to print' do
      board.should_receive(:print)
      game.auto_fill_row
    end

    context 'when the board is invalid' do
      before do
        board.stub(:valid?).and_return(false)
      end

      it 'prints an error message' do
        stdout.should_receive(:puts)
        stdout.should_receive(:puts) do |message|
          message.should include('invalid')
        end
        game.auto_fill_row
      end

      it 'clears the last entered row' do
        board.should_receive(:clear_row)
        game.auto_fill_row
      end
    end

    context 'when the board is valid' do
      before do
        board.stub(:valid?).and_return(true)
      end

      it 'doesnt print an error message' do
        stdout.should_receive(:puts).once
        game.auto_fill_row
      end

      it 'doesnt clear the last entered row' do
        board.should_not_receive(:clear_row)
        game.auto_fill_row
      end
    end
  end
end