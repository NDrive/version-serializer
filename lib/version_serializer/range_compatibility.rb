module VersionSerializer
  module RangeCompatibility
    def has_version?
      min_version || max_version
    end

    def compatible? version
      return true unless has_version?

      version = SemanticVersion.new(version) if version.is_a? String

      (min_version.nil? || min_version && version >= min_version) &&
      (max_version.nil? || max_version && version <= max_version)
    end
  end
end
