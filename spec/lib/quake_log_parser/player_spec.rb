require 'spec_helper'

describe QuakeLogParser::Player do
  
  before do
    @player = QuakeLogParser::Player.new(1, "dummy_player")
  end

  subject { @player }

  it { should respond_to :id }
  it { should respond_to :name }
  it { should respond_to :kills }
  it { should respond_to :deaths }

  it "should have zero kills and deaths after created" do
    @player.kills.should eql(0)
    @player.deaths.should eql(0)
  end
end
