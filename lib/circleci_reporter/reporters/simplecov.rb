require 'json'

require_relative '../result'
require_relative './base'

module CircleCIReporter
  module Reporters
    class SimpleCov < Base
      def self.default_dir
        'coverage'
      end

      def self.default_html_file_name
        'index.html'
      end

      def self.default_json_file_name
        '.last_run.json'
      end

      private

      # @param json [String]
      # @return [Float]
      def parse_json(json)
        JSON.parse(json)['result']['line'].to_f
      end
    end
  end
end
