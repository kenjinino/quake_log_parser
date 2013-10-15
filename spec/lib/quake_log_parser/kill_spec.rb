require 'spec_helper'

describe QuakeLogParser::Kill do
  
  before do
    @kill = QuakeLogParser::Kill.new(2, 3, 4)
  end

  subject { @kill }

  it { should respond_to :killer_id }
  it { should respond_to :killed_id }
  it { should respond_to :mean_of_death_id }
end
