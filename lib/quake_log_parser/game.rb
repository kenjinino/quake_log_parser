module QuakeLogParser
  class Game

    def initialize(name)
      @name = name
      @players = []
    end
    
    attr_reader :name
    attr_accessor :players
  end
end
