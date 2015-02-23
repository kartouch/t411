# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 't411/version'

Gem::Specification.new do |spec|
  spec.name          = "t411"
  spec.version       = T411::VERSION
  spec.authors       = ["Christophe Augello"]
  spec.email         = ["christophe@augello.be"]
  spec.description   = "Ruby wrapper for the t411.io API"
  spec.summary       = "Ruby wrapper for the t411.io API"
  spec.homepage      = "https://www.github.com/kartouch/t411"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
