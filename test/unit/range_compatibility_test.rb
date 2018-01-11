require 'version_serializer'
require 'test_helper'


class CompatibilityTest < MiniTest::Test

  class TestResource
    include VersionSerializer::RangeCompatibility

    attr_accessor :min_version, :max_version

    def initialize(min_version=nil, max_version=nil)
      @min_version = VersionSerializer::SemanticVersion.new(min_version) if min_version
      @max_version = VersionSerializer::SemanticVersion.new(max_version) if max_version
    end

  end

  def test_compatible
    [
      ["1.2", "1.5"],
      [nil, "1.5"],
      ["1.2.1", nil],
      [nil, nil]
    ].each do |min, max|
      assert TestResource.new(min, max).compatible?("1.2.2")
    end
  end

  def test_incompatible
    [
      ["1.2", "1.5"],
      [nil, "1.2"],
      ["1.7.7", nil]
    ].each do |min, max|
      assert !TestResource.new(min, max).compatible?("1.6")
    end
  end
end
