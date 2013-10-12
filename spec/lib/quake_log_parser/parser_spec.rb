require 'spec_helper'

describe QuakeLogParser::Parser do

  before do
    @parser = QuakeLogParser::Parser.new("dummy_file_path")
  end

  subject { @parser }

  it { should respond_to :file_path }
end
