# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth-untappd/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-untappd'
  spec.version       = Omniauth::Untappd::VERSION
  spec.authors       = ['Patrick Strang']
  spec.email         = %w(strangnet@gmail.com)
  spec.description   = %q{Omniauth strategy for Untappd}
  spec.summary       = %q{Omniauth strategy for Untappd}
  spec.homepage      = 'https://github.com/strangnet/omniauth-untappd'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'multi_json', '~> 1.7.2'
  spec.add_runtime_dependency 'omniauth-oauth', '~> 1.0.1'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.13.0'
end
