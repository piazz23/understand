# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'understand/version'

Gem::Specification.new do |spec|
  spec.name          = "understand"
  spec.version       = Understand::VERSION
  spec.authors       = ["piazz32"]
  spec.email         = ["salvatorepiazzolla3@gmail.com"]
  spec.description   = %q{Gem to monitoring and save the the application stats}
  spec.summary       = %q{I don't know what is the summary}
  spec.homepage      = "https://github.com/piazz23/understand"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
