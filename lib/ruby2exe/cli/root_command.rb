# frozen_string_literal: true

require_relative "build_command"

module Ruby2exe
  module Cli
    class RootCommand < Clamp::Command
      banner "🔆 ruby2exe #{Ruby2exe::VERSION}"

      option ['-v', '--version'], :flag, "Show version information" do
        puts Ruby2exe::VERSION
        exit 0
      end

      subcommand ["version"], "Show version information", VersionCommand
      subcommand ["build"], "build", BuildCommand

      def self.run
        super
      rescue StandardError => exc
        warn exc.message
        warn exc.backtrace.join("\n")
      end
    end
  end
end
