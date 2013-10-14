require 'spec_helper'

using ArrayHelpers

shared_examples "find and compare" do |players, dummy_player, new_name|

  it "a player and it's array" do
    @found_player = players.find_or_create_player_by_id_and_name(dummy_player.id, new_name)
    @found_player.should be_an_instance_of(QuakeLogParser::Player)

    @found_player.id.should eql(dummy_player.id)
    unless new_name.empty?
      @found_player.name.should eql(new_name)
    else
      @found_player.name.should eql(dummy_player.name)
    end
    players.size.should eql(1)
  end
end

describe "Array helpers" do

  describe "#find_or_create_player_by_id_and_name" do

    context "new player" do
      @dummy_player = QuakeLogParser::Player.new(1, "dummy_player")
      it_should_behave_like "find and compare", Array.new, @dummy_player, @dummy_player.name
    end

    context "old player" do
      @dummy_player = QuakeLogParser::Player.new(1, "dummy_player")
      it_should_behave_like "find and compare", Array.new(1, @dummy_player), @dummy_player, @dummy_player.name
    end

    context "old player with new name" do
      @dummy_player = QuakeLogParser::Player.new(1, "dummy_player")
      it_should_behave_like "find and compare", Array.new(1, @dummy_player), @dummy_player, "new name"
    end

    context "old player with new empty name" do
      @dummy_player = QuakeLogParser::Player.new(1, "dummy_player")
      it_should_behave_like "find and compare", Array.new(1, @dummy_player), @dummy_player, ""
    end
  end
end

