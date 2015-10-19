require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -r ./lib/feedjira"
end

task default: :spec
