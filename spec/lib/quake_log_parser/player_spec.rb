require 'spec_helper'

describe QuakeLogParser::Player do
  
  let(:player) { QuakeLogParser::Player.new(1, "dummy_player") }
  let(:killed_player) { QuakeLogParser::Player.new(2, "killed_player") }

  subject { player }

  it { should respond_to :id }
  it { should respond_to :name }
  it { should respond_to :kills }
  it { should respond_to :deaths }

  it "should have zero kills and deaths after created" do
    player.kills.should eql(0)
    player.deaths.should eql(0)
  end

  describe "#killed" do
  
    before do
      player.killed(killed_player)
    end

    it "should have increased player's kills count" do
      player.kills.should eql(1)
    end 

    it "killed player's death count should have increased" do
      killed_player.deaths.should eql(1)
    end 
  end

  describe "#killed_by_world" do
    it "should have kills count decreased" do
      player.killed_by_world
      player.kills.should eql(-1)
    end
  end
end
