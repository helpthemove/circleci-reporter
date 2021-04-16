# frozen_string_literal: true

require 'json'

require_relative '../result'
require_relative './base'

module CircleCIReporter
  module Reporters
    class RubyCritic < Base
      DEFAULT_DIR = 'rubycritic'
      def self.default_dir
        'rubycritic'
      end

      def self.default_html_file_name
        'overview.html'
      end

      def self.default_json_file_name
        'report.json'
      end

      private

      # @param json [String]
      # @return [Float]
      def parse_json(json)
        JSON.parse(json)['score'].to_f
      end
    end
  end
end
