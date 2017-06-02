require 'version_serializer'
require 'test_helper'

class VersionTest < MiniTest::Test
  def test_serialize_version
    assert_equal 3.002, VersionSerializer::Version.dump(VersionSerializer::Version.new(3, 2))
  end

  def test_serialize_double_digit_version
    assert_equal 3.021, VersionSerializer::Version.dump(VersionSerializer::Version.new(3, 21))
  end

  def test_load_version
    v = VersionSerializer::Version.load(3.002)
    assert_equal [v.major, v.minor], [3, 2]
  end

  def test_load_double_digit_version
    v = VersionSerializer::Version.load(3.012)
    assert_equal [v.major, v.minor], [3, 12]
  end

  def test_load_version_from_string
    v = VersionSerializer::Version.from_string("3.2")
    assert_equal [v.major, v.minor], [3, 2]
  end

  def test_load_double_digit_version_from_string
    v = VersionSerializer::Version.from_string("3.12")
    assert_equal [v.major, v.minor], [3, 12]
  end

  def test_dump_version_to_string
    assert_equal "3.2", VersionSerializer::Version.new(3,2).to_s
  end

  def test_dup_double_digit_version_to_string
    assert_equal "3.12", VersionSerializer::Version.new(3,12).to_s
  end

  def test_retrieve_database_range
    assert_equal 3.002 .. 3.012, VersionSerializer::Version.range(VersionSerializer::Version.from_string("3.2"), VersionSerializer::Version.from_string("3.12"))
  end

  def test_compare_versions_with_different_majors
    assert VersionSerializer::Version.new(3, 0) < VersionSerializer::Version.new(4, 0)
  end

  def test_compare_versions_with_multidigit_minors
    assert VersionSerializer::Version.new(3, 2) < VersionSerializer::Version.new(3, 12)
  end

end
