require 'spec_helper'

describe QuakeLogParser::Game do

  let(:game) { QuakeLogParser::Game.new("dummy_game") }

  subject { game }

  it { should respond_to :name }
  it { should respond_to :players }
  it { should respond_to :total_kills }
  it { should respond_to :kills }

  describe "#players_names" do

    before do
      game.players.push(QuakeLogParser::Player.new("1", "Peter"))
      game.players.push(QuakeLogParser::Player.new("2", "Brian"))
      game.players.push(QuakeLogParser::Player.new("3", "Stewie"))
    end

    it "should return player's names" do
      game.players_names.should =~ ["Peter", "Brian", "Stewie"]
    end
  end

  describe "#players_kills" do

    before do
      game.players.push(QuakeLogParser::Player.new("1", "Peter"))
      game.players.push(QuakeLogParser::Player.new("2", "Brian"))
      game.players.push(QuakeLogParser::Player.new("3", "Stewie"))
  
      game.players[0].kills = 3
      game.players[1].deaths = 5
      game.players[2].kills = -1
    end

    it "should return kills scoreboard" do
      game.players_kills.should == {"Peter" => {kills: 3, deaths: 0}, "Brian" => {kills: 0, deaths: 5}, "Stewie" => {kills: -1, deaths: 0}}
    end
  end

  describe "#means_of_death_scoreboard" do
    before do
      game.means_of_death_counter[1] = 3
      game.means_of_death_counter[4] = 1
      game.means_of_death_counter[5] = 2
      game.means_of_death_counter[10] = 5
    end

    it "should return means of death scoreboard" do
      game.means_of_death_scoreboard.should == {"MOD_SHOTGUN" => 3, "MOD_GRENADE" => 1, "MOD_GRENADE_SPLASH" => 2, "MOD_RAILGUN" => 5}
    end
  end
end
