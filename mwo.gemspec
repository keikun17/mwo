# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mwo/version'

Gem::Specification.new do |spec|
  spec.name          = "mwo"
  spec.version       = Mwo::VERSION
  spec.authors       = ["Buddy Magsipoc"]
  spec.email         = ["keikun17@gmail.com"]
  spec.summary       = "Ruby gem for interfacing with Mechwarrior Online's Public API"
  spec.description   = "Ruby gem for interfacing with Mechwarrior Online's Public API"
  spec.homepage      = "https://github.com/keikun17/mwo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rspec-collection_matchers"
end
