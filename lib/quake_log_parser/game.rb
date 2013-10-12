module QuakeLogParser
  class Game

    def initialize(name)
      @name = name
      @players = []
      @total_kills = 0
      @kills = []
    end
    
    attr_reader :name
    attr_accessor :players, :total_kills, :kills
  end
end
