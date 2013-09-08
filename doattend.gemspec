# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doattend/version'

Gem::Specification.new do |spec|
  spec.name          = "doattend"
  spec.version       = Doattend::VERSION
  spec.authors       = ["Swaroop SM"]
  spec.email         = ["swaroop.striker@gmail.com"]
  spec.description   = %q{Communicating with DoAttend API}
  spec.summary       = %q{This provides a rails generator and functions to communicate with the DoAttend API.}
  spec.homepage      = "https://github.com/swaroopsm/doattend"
  spec.license       = "MIT"

  spec.files         = Dir["README.md","Gemfile","Rakefile", "spec/*", "lib/**/*"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rails", ">= 3.2.13"
  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "json"
end
