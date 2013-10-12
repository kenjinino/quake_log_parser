require 'spec_helper'

describe QuakeLogParser::Game do

  before do
    @game = QuakeLogParser::Game.new("dummy_game")
  end

  subject { @game }

  it { should respond_to :name }
  it { should respond_to :players }
  it { should respond_to :total_kills }
  it { should respond_to :kills }
end
