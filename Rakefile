require "minitest/test_task"
require "rubocop/rake_task"

task :run do
  ruby "lib/free_cell.rb"
end

Minitest::TestTask.create

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ["lib/**/*.rb", "test/**/*.rb", "Rakefile", "Gemfile"]
end

task default: [:test, :lint]
