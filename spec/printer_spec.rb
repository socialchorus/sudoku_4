require 'spec_helper'

describe Printer do
  let(:board) { double('board') }
  let(:printer) { Printer.new(board, stdout) }
  let(:stdout) {double("stdout")}

  describe "#initialize" do
    context 'when we initialize a printer' do
      it 'should store the board' do
        printer.board.should == board
      end
      
      it "should start out with a template" do
        printer.template.is_a?(String).should == true
        printer.template.should include('| {{1}} |')
      end
    end
  end
  
  describe '#matched_patterns' do
    it "should return an array of things to substitute" do
      printer.matched_patterns.length.should == 16
      printer.matched_patterns.each do |pattern|
        pattern.should match(/\{\{\d+\}\}/)
      end
    end
  end
  
  describe '#render_board_template' do
    before do
      board.stub(:value_at).and_return(' ')
    end
    
    it "should replace each matched pattern with what it gets from the board" do
      printer.render_board_template
      printer.template.should_not include('| {{15}} |')
      printer.template.should include('   ')
    end
  end
  
  describe '#print' do  
    before do
      printer.stub(:put_string)
      board.stub(:value_at).and_return(' ')
    end
    
    it "calls render_board_template" do
      printer.should_receive(:render_board_template)
      printer.print
    end
    
    it "should puts out the template that has been modified" do
      printer.should_receive(:put_string).with(printer.template)
      printer.print
    end
  end
end