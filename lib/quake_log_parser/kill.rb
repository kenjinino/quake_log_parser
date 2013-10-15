module QuakeLogParser
  class Kill
    
    def initialize(killer_id, killed_id, mean_of_death_id)
      @killer_id = killer_id
      @killed_id = killed_id
      @mean_of_death_id = mean_of_death_id
    end

    attr_reader :killer_id, :killed_id, :mean_of_death_id
  end
end
