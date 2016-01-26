# Configure Rails Envinronment
ENV['RAILS_ENV'] = 'test'

require 'bundler/setup'
require 'simplecov'
require 'simplecov-summary'
load File.join(File.dirname(File.dirname(__FILE__)), 'Rakefile')
require 'capistrano/gitflow'

# require "codeclimate-test-reporter"
formatters = [SimpleCov::Formatter::HTMLFormatter]


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)

SimpleCov.start 'rails' do
  add_filter 'spec'

  at_exit {}
end

# CodeClimate::TestReporter.configure do |config|
#  config.logger.level = Logger::WARN
# end
# CodeClimate::TestReporter.start



RSpec.configure do |config|
  require 'rspec/expectations'
  config.include RSpec::Matchers

  config.mock_with :mocha

  config.after(:suite) do
    if SimpleCov.running
      SimpleCov::Formatter::HTMLFormatter.new.format(SimpleCov.result)

      SimpleCov::Formatter::SummaryFormatter.new.format(SimpleCov.result)
    end
  end
end
