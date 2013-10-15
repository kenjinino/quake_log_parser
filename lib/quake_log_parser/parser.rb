
using ArrayHelpers
using StringHelpers
    
module QuakeLogParser
  class Parser
    def initialize(file_path)
      @file_path = file_path
      @content = nil
      @games = []
    end
    
    attr_reader :file_path
    
    attr_accessor :content, :games

    def read
      content = File.open(@file_path)
    end

    def parse
      i = 1
      current_game = nil
      read.readlines.each do |line|
        case
          when line.is_clientuserinfochanged?
            player_id = line.clientuserinfochanged[:player_id]
            player_name = line.clientuserinfochanged[:player_name]
            current_game.players.find_or_create_player_by_id_and_name(player_id, player_name)
          when line.is_kill?
            killer_id = line.kill[:killer_id]
            killed_id = line.kill[:killed_id]
            mean_of_death_id = line.kill[:mean_of_death_id]

            current_game.means_of_death_counter[mean_of_death_id.to_i] += 1

            current_game.kills.push(QuakeLogParser::Kill.new(killer_id, killed_id, mean_of_death_id))

            killed_player = current_game.players.find_or_create_player_by_id_and_name(killed_id)
            unless killer_id == self.class.world_id
              killer_player = current_game.players.find_or_create_player_by_id_and_name(killer_id)
              killer_player.killed(killed_player)
            else
              killed_player.killed_by_world
            end


            current_game.total_kills += 1
          when line.is_initgame?
            current_game = QuakeLogParser::Game.new("game_" + i.to_s)
            @games.push current_game
            i += 1
        end
      end
    end

    #Some default values
    def self.world_id
      "1022"
    end

    def self.means_of_death
      %w(
        MOD_UNKNOWN
        MOD_SHOTGUN
        MOD_GAUNTLET
        MOD_MACHINEGUN
        MOD_GRENADE
        MOD_GRENADE_SPLASH
        MOD_ROCKET
        MOD_ROCKET_SPLASH
        MOD_PLASMA
        MOD_PLASMA_SPLASH
        MOD_RAILGUN
        MOD_LIGHTNING
        MOD_BFG
        MOD_BFG_SPLASH
        MOD_WATER
        MOD_SLIME
        MOD_LAVA
        MOD_CRUSH
        MOD_TELEFRAG
        MOD_FALLING
        MOD_SUICIDE
        MOD_TARGET_LASER
        MOD_TRIGGER_HURT
        MOD_NAIL
        MOD_CHAINGUN
        MOD_PROXIMITY_MINE
        MOD_KAMIKAZE
        MOD_JUICED
        MOD_GRAPPLE
      )
    end
  end
end

