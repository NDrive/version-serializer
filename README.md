# VersionSerializer

Serializes semantic versions and adds compatibility methods to check if a given
instance is compatible with a certain version by specifying a range.

## Installation

Add this line to your application's Gemfile:

    gem 'version_serializer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install version_serializer


## Usage

```ruby

# Model Definition
class YourModel < ActiveRecord::Base
  include VersionSerializer::RangeCompatibility
  serialize :min_version, VersionSerializer::SemanticVersion
  serialize :max_version, VersionSerializer::SemanticVersion
end

# Compatibility
m = YourModel.create(min_version: "1.0.1", max_version: "2.3.4")
m.compatible? "2.0"
```
