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

    def killed(killed_player)
      @kills += 1

      killed_player.deaths += 1
    end

    def killed_by_world
      @kills -= 1
    end
  end
end
