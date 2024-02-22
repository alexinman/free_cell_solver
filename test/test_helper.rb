require "simplecov"
require "custom_assertions"
require "minitest/autorun"
require "minitest/reporters"

require_relative "../lib/free_cell_solver"

if ENV["SPEC_REPORTER"]
  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
else
  Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new
end
