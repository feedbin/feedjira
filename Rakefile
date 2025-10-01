require "rspec/core/rake_task"
require "yard"

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
end

YARD::Rake::YardocTask.new do |t|
  t.files   = ["lib/**/*.rb", "-", "LICENSE"]
end

task default: [:spec]
