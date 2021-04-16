# frozen_string_literal: true

require 'circleci_reporter'

namespace :circleci_reporter do
  desc 'Report test coverage'
  task :coverage do
    abort unless ENV['CIRCLECI']

    CircleCIReporter.configure do |config|
      config.circleci_token = ENV['CIRCLECI_REPORTER_CIRCLECI_TOKEN']
      config.vcs_token = ENV['CIRCLECI_REPORTER_VCS_TOKEN']
    end

    CircleCIReporter.run
  end
end
