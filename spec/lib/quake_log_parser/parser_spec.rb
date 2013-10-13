require 'spec_helper'

describe QuakeLogParser::Parser do

  before do
    @parser = QuakeLogParser::Parser.new("spec/support/example_game.log")
  end

  subject { @parser }

  it { should respond_to :file_path }
  it { should respond_to :content }

  describe "#read" do

    it "should read the file correctly" do
      @parser.read.size.should eql(3172)
    end

    it "should have the right number of lines" do
      @parser.read.readlines.size.should eql(61)
    end
  end
end
