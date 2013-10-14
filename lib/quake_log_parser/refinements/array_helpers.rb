module ArrayHelpers
  refine Array do
    def find_or_create_player_by_id_and_name(id, name)
      each do |player|
        if player.id == id
          player.name = name
          return player
        end
      end

      @new_player = QuakeLogParser::Player.new(id, name)
      push @new_player

      @new_player
    end
  end
end
