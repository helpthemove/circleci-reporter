# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'circleci_reporter/version'

Gem::Specification.new do |spec|
  spec.name          = 'circleci_reporter'
  spec.version       = CircleCIReporter::Version.to_s
  spec.authors       = ['Yuku Takahashi', 'Filippo Liverani']

  spec.summary       = 'Report CircleCI test coverage and static analysis'
  spec.description   = 'Report CircleCI test coverage and static analysis results to your GitHub repository'
  spec.homepage      = 'https://github.com/filippoliverani/circleci-reporter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.7'

  spec.add_dependency 'faraday', '~> 1.0'
  spec.add_dependency 'faraday_middleware', '~> 1.0'

  spec.add_development_dependency 'ffaker', '~> 2.18'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.4'
  spec.add_development_dependency 'rubocop', '~> 1.12'
  spec.add_development_dependency 'rubocop-performance', '~> 1.10'
  spec.add_development_dependency 'rubocop-rake', '~> 0.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
  spec.add_development_dependency 'rubycritic', '~> 4.6'
  spec.add_development_dependency 'simplecov', '~> 0.21'
  spec.add_development_dependency 'yard', '~> 0.9'
end
