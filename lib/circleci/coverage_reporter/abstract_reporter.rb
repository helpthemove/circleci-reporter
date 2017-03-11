require_relative 'report'

module CircleCI
  module CoverageReporter
    # @abstract Subclass and override {#name}, {#create_build_result} and {#create_current_result}
    #   to implement a custom Reporter class.
    class AbstractReporter
      # @param base_build [Build, nil]
      # @param previous_build [Build, nil]
      # @return [Report]
      def report(base_build, previous_build)
        Report.new(
          self,
          current: create_current_result,
          base: create_build_result(base_build),
          previous: create_build_result(previous_build)
        )
      end

      # @return [String]
      def name
        raise NotImplementedError
      end

      private

      # @param build [Build, nil]
      # @return [AbstractResult, nil]
      def create_build_result(build) # rubocop:disable Lint/UnusedMethodArgument
        raise NotImplementedError
      end

      # @return [AbstractResult]
      def create_current_result
        raise NotImplementedError
      end

      # @return [Client]
      def client
        CoverageReporter.client
      end
    end
  end
end