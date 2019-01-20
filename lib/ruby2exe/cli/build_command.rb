# frozen_string_literal: true

require "tmpdir"

module Ruby2exe
  module Cli
    class BuildCommand < Clamp::Command
      parameter "NAME", "name"

      def execute
        cores = Ruby2exe.cores + 1
        tmpdir = Dir.mktmpdir

        `"#{Ruby2exe.rubyc_path}" rubyc -d #{tmpdir} -o #{name} --make-args="-j#{cores}" #{name}`
      end
    end
  end
end
