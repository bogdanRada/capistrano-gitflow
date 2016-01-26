# Configure Rails Envinronment
ENV['RAILS_ENV'] = 'test'

require 'bundler/setup'
require 'rake'
require 'simplecov'
require 'simplecov-summary'
require 'rspec/its'

require 'capistrano/all'
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/gitflow'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

def root
  File.dirname(File.dirname(__FILE__))
end

 require 'mocha/api'

Dir.glob(File.join(root, "spec/support/shared_contexts/**/*.rb")).each {|f| require f}

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
  config.raise_errors_for_deprecations!
  config.mock_framework = :mocha
  #config.order = 'random'
  #config.mock_with :mocha

  config.after(:suite) do
    if SimpleCov.running
      SimpleCov::Formatter::HTMLFormatter.new.format(SimpleCov.result)

      SimpleCov::Formatter::SummaryFormatter.new.format(SimpleCov.result)
    end
  end
end
