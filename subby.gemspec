# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'subby/version'

Gem::Specification.new do |gem|
  gem.name          = "subby"
  gem.version       = Subby::VERSION
  gem.authors       = ["Ash McKenzie"]
  gem.email         = ["ash@greenworm.com.au"]
  gem.description   = %q{Subby - Command line option parser with subcommand support}
  gem.summary       = %q{Subby - Command line option parser with subcommand support}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 2.0'
  gem.add_development_dependency 'simplecov', '~> 0.7'
  gem.add_development_dependency 'pry', '~> 0.9'
end
