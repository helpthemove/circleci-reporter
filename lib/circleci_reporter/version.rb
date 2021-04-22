# frozen_string_literal: true

module CircleCIReporter
  module Version
    MAJOR = 1
    MINOR = 0
    PATCH = 1

    def self.to_s
      [MAJOR, MINOR, PATCH].join('.')
    end
  end
end
