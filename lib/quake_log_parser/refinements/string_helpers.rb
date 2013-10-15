module StringHelpers
  refine String do
    def is_initgame?
      match(/InitGame:/) ? true : false
    end

    def is_clientuserinfochanged?
      match(/ClientUserinfoChanged:/) ? true : false
    end

    def is_kill?
      match(/Kill:/) ? true : false
    end

    def clientuserinfochanged
      match(/\s(?<player_id>\d+)\sn\\(?<player_name>[\w\s]+)\\t/)
    end

    def kill
      match(/(?<killer_id>\d+)\s(?<killed_id>\d+)\s(?<mean_of_death_id>\d+)/)
    end
  end
end
