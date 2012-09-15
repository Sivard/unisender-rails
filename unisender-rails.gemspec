# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unisender-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "unisender-rails"
  gem.version       = Unisender::Rails::VERSION
  gem.authors       = ["Sergey Gribovski (Aforex)"]
  gem.email         = ["sgribovskiy@aforex.ru"]
  gem.description   = %q{It is a wrapper for uni_sender gem}
  gem.summary       = %q{It is a wrapper for uni_sender gem to use it like rails ActionMailer}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "uni_sender", ">=0"
end
