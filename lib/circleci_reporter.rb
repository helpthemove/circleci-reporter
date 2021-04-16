# frozen_string_literal: true

require_relative 'circleci_reporter/client'
require_relative 'circleci_reporter/configuration'
require_relative 'circleci_reporter/errors'
require_relative 'circleci_reporter/runner'

require_relative 'circleci_reporter/reporters/flow'
require_relative 'circleci_reporter/reporters/link'
require_relative 'circleci_reporter/reporters/rubycritic'
require_relative 'circleci_reporter/reporters/simplecov'

module CircleCIReporter
  class << self
    # Setters for shared global objects
    # @api private
    attr_writer :client, :configuration
  end

  # @return [Configuration]
  def self.configuration
    @configuration ||= Configuration.new
  end

  # @return [Client]
  def self.client
    @client ||= Client.new
  end

  # Yields the global configuration to a block.
  #
  # @yield [Configuration]
  def self.configure
    yield configuration if block_given?
  end

  # @return [void]
  def self.run
    configuration.reporters.select!(&:active?)
    configuration.dump
    raise NoActiveReporter if configuration.reporters.empty?

    Runner.new.tap(&:dump).run
  end
end
