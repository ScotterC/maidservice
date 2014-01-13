# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maidservice/version'

Gem::Specification.new do |spec|
  spec.name          = "maidservice"
  spec.version       = Maidservice::VERSION
  spec.authors       = ["Scott Carleton"]
  spec.email         = ["scott@artsicle.com"]
  spec.description   = %q{Distributed Page Cache Clearing using Redis pub/sub and hooking into Rails page caching}
  spec.summary       = %q{Distributed Page Cache Clearing using Redis pub/sub}
  spec.homepage      = "https://github.com/ScotterC/maidservice"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'railties', '> 3'

  spec.add_dependency "redis-namespace", "~> 1.3"
  spec.add_dependency "redis", "> 3"
  spec.add_dependency "activesupport", "> 3"
end
