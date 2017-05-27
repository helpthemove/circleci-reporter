module CircleCI
  module CoverageReporter
    # Encapsulate a CircleCI build
    #
    # @attr vcs_revision [String] revision of git
    # @attr build_number [Integer] the ID of the CircleCI build
    Build = Struct.new(:vcs_revision, :build_number) do
      # @param revision [String]
      # @return [Boolean]
      def match?(revision)
        vcs_revision.start_with?(revision)
      end

      # @return [Array<Artifact>]
      def artifacts
        @artifacts ||= CoverageReporter.client.artifacts(build_number)
      end

      # @param end_with [String]
      # @return [Artifact, nil]
      def find_artifact(end_with)
        artifacts.find { |artifact| artifact.end_with?(end_with) }
      end
    end
  end
end
