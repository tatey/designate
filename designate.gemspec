# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'designate/version'

Gem::Specification.new do |spec|
  spec.name          = 'designate'
  spec.version       = Designate::VERSION
  spec.authors       = ['Tate Johnson']
  spec.email         = ['tate@tatey.com']
  spec.description   = %q{A short hand for turning instance methods into a one-liner for service-type classes.}
  spec.summary       = %q{A short hand for turning instance methods into a one-liner for service-type classes.}
  spec.homepage      = 'https://github.com/tatey/designate'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
