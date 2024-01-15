require "minitest/test_task"
require "rubocop/rake_task"
require_relative "test/coverage_validator"

task :run do
  ruby "lib/free_cell.rb", ARGV[1].to_s
end

task :coverage, [:filename] do |_t, args|
  abort unless CoverageValidator.call(args[:filename])
end

Minitest::TestTask.create do |t|
  # Defaults to requiring minitest/autorun
  # The default prevents simplecov from functioning correctly as it needs to be loaded before anything else.
  # Setting it to `nil` allows simplecov to be required first in test_helper.rb and then minitest gets loaded after.
  t.framework = nil
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ["lib/**/*.rb", "test/**/*.rb", "Rakefile", "Gemfile"]
end

task default: [:test, :lint, :coverage]
