module QuakeLogParser
  class Game

    def initialize(name)
      @name = name
      @players = []
      @total_kills = 0
      @kills = []
      @means_of_death_counter = Array.new(QuakeLogParser::Parser.means_of_death.size, 0)
    end
    
    attr_reader :name
    attr_accessor :players, :total_kills, :kills, :means_of_death_counter

    def to_json
      game = {}

      game[@name] = {
        total_kills: @total_kills,
        players: players_names,
        kills: players_kills,
        kills_by_means: means_of_death_scoreboard
      }
      game.to_json
    end

    def players_names
      names = []
      @players.each { |p| names.push(p.name) }

      names
    end

    def players_kills
      kills = {}

      @players.each { |p| kills[p.name] = { kills: p.kills, deaths: p.deaths }}

      kills
    end

    def means_of_death_scoreboard
      means_scoreboard = {}

      @means_of_death_counter.each_with_index { |m, index| means_scoreboard[QuakeLogParser::Parser.means_of_death[index]] = m if m != 0 }

      means_scoreboard
    end
  end
end
