require "json"
require "colorize"

class CoverageValidator
  def self.call(...)
    new(...).call
  end

  def initialize(filename=nil)
    filename ||= "coverage/.last_run.json"
    self.result = JSON.load_file(filename)["result"]
  end

  def call
    valid?("branch") && valid?("line")
  end

  private

  attr_accessor :result

  def valid?(type)
    return true if result[type] >= 100

    warn "#{type.capitalize} coverage (#{result[type]}%) is below the expected minimum coverage (100.0%).".red
  end
end
