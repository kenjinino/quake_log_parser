module QuakeLogParser
  class Player
    
    def initialize(id, name)
      @id = id
      @name = name
      @kills = 0
      @deaths = 0
    end

    attr_reader :id
    attr_accessor :name, :kills, :deaths
  end
end
