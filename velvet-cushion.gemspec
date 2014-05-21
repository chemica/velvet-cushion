# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'velvet_cushion/version'

Gem::Specification.new do |spec|
  spec.name          = "velvet-cushion"
  spec.version       = VelvetCushion::VERSION
  spec.authors       = ["Ben Dunkley"]
  spec.email         = ["ben@chemica.co.uk"]
  spec.summary       = %q{Allow recursive stuffing of API data into ActiveRecord objects}
  spec.description   = %q{Stuffs ActiveRecord objects with API data. Makes intelligent guesses about object
                          relationships based on ActiveRecord relationships and allows overriding of particular
                          field names with class level model directives if required.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.9.3'
  spec.add_dependency "activerecord"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
end
