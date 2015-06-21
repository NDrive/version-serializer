require "version_serializer/version"

module VersionSerializer
  class Version
    attr_accessor :major, :minor

    def initialize major, minor
      @major = major
      @minor = minor
    end

    def self.load (data)
      return nil if data.nil?
      self.new(*('%.3f' % data).split('.').map(&:to_i))
    end

    def self.dump (object)
      return nil if object.nil?

      ("%d.%03d" % [object.major, object.minor]).to_f
    end

    def self.from_string data
      return nil if data.nil?
      self.new(*data.to_s.split('.').map(&:to_i))
    end

    def self.range min, max
      self.dump(min) .. self.dump(max)
    end

    include Comparable
    def <=> other
      return nil if other.nil?

      [major, minor] <=> [other.major, other.minor]
    end

    def as_json options = {}
      to_s
    end

    def to_s
      return nil if major.nil? || minor.nil?

      "%d.%d" % [major, minor]
    end
  end
end
