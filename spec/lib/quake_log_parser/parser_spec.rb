require 'spec_helper'

using ArrayHelpers

describe QuakeLogParser::Parser do

  let(:parser) { QuakeLogParser::Parser.new("spec/support/example_game.log") }

  subject { parser }

  it { should respond_to :file_path }
  it { should respond_to :content }
  it { should respond_to :games }

  it "should have empty games after initialized" do
    parser.games.empty?.should be_true
  end

  describe "#read" do

    it "should read the file correctly" do
      #number os bytes should be correct
      parser.read.size.should eql(3172)
    end

    it "should have the right number of lines" do
      parser.read.readlines.size.should eql(61)
    end
  end

  describe "#parse" do

    before do
      parser.parse
    end

    it "should have the correct number of games" do
      parser.games.size.should eql(1)
    end

    it "should have the right number of players" do
      parser.games.first.players.size.should eql(3)
    end 

    it "should have counted the number of total_kills correctly" do
      parser.games.first.total_kills.should eql(4)
    end 

    it "should have counted the number of kills correctly" do
      parser.games.first.kills.size.should eql(4)
    end 

    it "should have the right number of kills and deaths" do
      current_game = parser.games.first

      isgalamido = current_game.players.find_or_create_player_by_id_and_name("3")
      isgalamido.kills.should eql(1)
      isgalamido.deaths.should eql(0)

      mocinha = current_game.players.find_or_create_player_by_id_and_name("2")
      mocinha.kills.should eql(-1)
      mocinha.deaths.should eql(1)

      zeh = current_game.players.find_or_create_player_by_id_and_name("4")
      zeh.kills.should eql(-2)
      zeh.deaths.should eql(0)

    end
  end

  describe "#means_of_death" do
    it "should return means of death" do
      QuakeLogParser::Parser.means_of_death[1].should eql("MOD_SHOTGUN")
    end
  end
end
