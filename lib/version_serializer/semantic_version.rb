module VersionSerializer
  class SemanticVersion < Gem::Version
    def self.load (data)
      return nil if data.nil?
      self.new(data)
    end

    def self.dump (object)
      return nil if object.nil?
      object.to_s
    end
  end
end
