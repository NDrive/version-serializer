require 'version_serializer'
require 'test_helper'

class SemanticVersionTest < MiniTest::Test
  def test_load
    assert_equal VersionSerializer::SemanticVersion.new("2.4.0"), VersionSerializer::SemanticVersion.load("2.4.0")
  end

  def test_dump
    version = VersionSerializer::SemanticVersion.new("2.4.0")
    assert_equal version.to_s, VersionSerializer::SemanticVersion.dump(version)
  end

  def test_nil_load
    assert_nil VersionSerializer::SemanticVersion.load(nil)
  end

  def test_nil_dump
    assert_nil VersionSerializer::SemanticVersion.dump(nil)
  end
end
