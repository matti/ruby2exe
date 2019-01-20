# frozen_string_literal: true

module Ruby2exe
  module Cli
    class VersionCommand < Clamp::Command
      def execute
        puts Ruby2exe::VERSION
      end
    end
  end
end
