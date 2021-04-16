# frozen_string_literal: true

require_relative '../circleci_reporter'
require_relative 'client'
require_relative 'configuration'

module CircleCIReporter
  # A sandbox isolates the enclosed code into an environment that looks 'new'
  # meaning globally accessed objects are reset for the duration of the sandbox.
  #
  # @note This module is not normally available. You must require
  #   `circleci_reporter/sandbox` to load it.
  module Sandbox
    # Execute a provided block with CircleCIReporter global objects(
    # configuration, client) reset.
    #
    # @yield [Configuration]
    # @return [void]
    def self.sandboxed
      orig_config = CircleCIReporter.configuration
      orig_client = CircleCIReporter.client

      CircleCIReporter.configuration = Configuration.new
      CircleCIReporter.client = Client.new

      yield CircleCIReporter.configuration
    ensure
      CircleCIReporter.configuration = orig_config
      CircleCIReporter.client = orig_client
    end
  end
end
