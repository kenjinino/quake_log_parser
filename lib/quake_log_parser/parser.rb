module QuakeLogParser
  class Parser

    def initialize(file_path)
      @file_path = file_path
    end
    
    attr_reader :file_path

  end
end

