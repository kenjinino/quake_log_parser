module QuakeLogParser
  class Parser

    def initialize(file_path)
      @file_path = file_path
      @content = nil
    end
    
    attr_reader :file_path, :content

    def read
      content = File.open(@file_path)
    end
  end
end

