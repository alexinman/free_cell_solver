require "simplecov"
require "custom_assertions"
require "minitest/autorun"
require "minitest/reporters"
require "require_all"

require_all "lib/free_cell"

if ENV["SPEC_REPORTER"]
  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
else
  Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new
end
