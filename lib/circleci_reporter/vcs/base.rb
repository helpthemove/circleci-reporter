# frozen_string_literal: true

module CircleCIReporter
  module VCS
    # @abstract Subclass and override {#create_comment} to implement a custom VCS client class.
    class Base
      # @param token [String]
      def initialize(token)
        @token = token
      end

      # @param body [String]
      # @return [void]
      def create_comment(body)
        raise NotImplementedError
      end

      private

      attr_reader :token
    end
  end
end
