module Ruby2exe
  def self.cores
    Integer(`sysctl -n hw.ncpu`)
  end

  def self.rubyc_path
    File.expand_path(
      File.join(__dir__, "..", "vendor", "rubyc-0.5.0+extra5-osx-amd64")
    )
  end
end

require_relative "ruby2exe/version"
