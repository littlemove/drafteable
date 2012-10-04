# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'drafteable/version'

Gem::Specification.new do |gem|
  gem.name          = "drafteable"
  gem.version       = Drafteable::VERSION
  gem.authors       = ["Diego Fernandez Fernandez"]
  gem.email         = ["diego.fernandez.fernandez@gmail.com"]
  gem.description   = %q{Drafteable is a super simple and opinionated ActiveRecord model draft
behavior encapsulation}
  gem.summary       = %q{Drafteable is a super simple and opinionated ActiveRecord model draft
behavior encapsulation}
  gem.homepage      = "http://github.com/littlemove/drafteable/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activerecord', '~> 3.2.8'
  gem.add_development_dependency 'rspec', '~> 2.11.0'
  gem.add_development_dependency 'sqlite3'
end
