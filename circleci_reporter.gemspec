# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'circleci_reporter/version'

Gem::Specification.new do |spec|
  spec.name          = 'circleci_reporter'
  spec.version       = CircleCIReporter::Version.to_s
  spec.authors       = ['Yuku Takahashi', 'Filippo Liverani']

  spec.summary       = 'Report test coverage to your GitHub repository'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/filippoliverani/circleci_reporter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.7'

  spec.add_dependency 'faraday', '~> 1.0'

  spec.add_development_dependency 'ffaker'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rubycritic'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
end
