# Configure Rails Envinronment
ENV['RAILS_ENV'] = 'test'

require 'bundler/setup'
require 'rake'
require 'simplecov'
require 'simplecov-summary'


def root
  File.dirname(File.dirname(__FILE__))
end

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
  require 'rspec/mocks'
  config.include RSpec::Matchers
  config.raise_errors_for_deprecations!
  config.mock_framework = :rspec
  #config.order = 'random'
  config.mock_with :rspec

  config.after(:suite) do
    if SimpleCov.running
      SimpleCov::Formatter::HTMLFormatter.new.format(SimpleCov.result)

      SimpleCov::Formatter::SummaryFormatter.new.format(SimpleCov.result)
    end
  end
end
