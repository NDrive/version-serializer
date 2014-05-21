# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version_serializer/version'

Gem::Specification.new do |spec|
  spec.name          = "version-serializer"
  spec.version       = VersionSerializer::VERSION
  spec.authors       = ["NDrive DevOps Team"]
  spec.email         = ["devops@ndrive.com"]
  spec.summary       = %q{Serialize version}
  spec.description   = %q{Serialize Version from any object that require version}
  spec.homepage      = "http://www.ndrive.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
