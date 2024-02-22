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
    puts "Coverage report: file://#{File.absolute_path("coverage/index.html")}."
    valid?("branch") && valid?("line")
  end

  private

  attr_accessor :result

  def valid?(type)
    if result[type] == 100
      puts "#{type.capitalize} coverage (#{result[type]}%) is meets the expected minimum coverage (100.0%).".green
      true
    else
      warn "#{type.capitalize} coverage (#{result[type]}%) is below the expected minimum coverage (100.0%).".red
      false
    end
  end
end
