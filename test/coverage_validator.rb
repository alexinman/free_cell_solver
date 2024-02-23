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
    valid, verb, color = validate(type)
    puts "#{type.capitalize} coverage (#{result[type]}%) #{verb} the minimum coverage (100.0%).".colorize(color)
    puts "See more details: file://#{File.absolute_path("coverage/index.html")}." unless valid
    valid
  end

  def validate(type)
    if result[type] == 100
      [true, "meets", :green]
    else
      [false, "is below", :red]
    end
  end
end
