require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = ['--backtrace', '--fail-fast'] if ENV['DEBUG']
end

desc 'Default: run the unit tests.'
task default: [:all]

desc 'Test the plugin under all supported Rails versions.'
task :all do |_t|
  if ENV['TRAVIS']
    exec('bundle exec rake  spec && bundle exec rake coveralls:push')
  else
    exec('bundle exec rake spec')
  end
end

if %w(test development).include?(ENV['RAILS_ENV'])
  load './spec/tasks.rake'
end
