require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake'
require 'appraisal'
require 'rdoc/task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "capistrano-gitflow"
    gem.summary = %Q{Capistrano recipe for a deployment workflow based on git tags }
    gem.description = %Q{Capistrano recipe for a deployment workflow based on git tags}
    gem.email = "josh@technicalpickles.com"
    gem.homepage = "http://github.com/technicalpickles/capistrano-gitflow"
    gem.authors = ["Joshua Nichols"]
    gem.add_dependency "capistrano"
    gem.add_dependency "stringex"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

RSpec::Core::RakeTask.new(:spec) do |spec|
   default_options = ['--colour', ' --format=documentation',  '-I lib', '-I spec']
  default_options.concat(['--backtrace', '--fail-fast']) if ENV['DEBUG']

  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = default_options
  spec.verbose = true
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
   default_options = ['--colour', ' --format=documentation',  '-I lib', '-I spec']
  default_options.concat(['--backtrace', '--fail-fast']) if ENV['DEBUG']

  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = default_options
  spec.verbose = true
  spec.rcov = true
  spec.rcov_opts = lambda do
    IO.readlines("#{Rails.root}/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
  end
end


desc 'Default: run the unit tests.'
task default: [:all]

desc 'Test the plugin under all supported Capistrano versions.'
task :all do |_t|
  if ENV['TRAVIS']
    if ENV['BUNDLE_GEMFILE'] =~ /gemfiles/
      appraisal_name = ENV['BUNDLE_GEMFILE'].scan(/capistrano\_(.*)\.gemfile/).flatten.first
      command_prefix = "appraisal capistrano-#{appraisal_name}"
      exec ("#{command_prefix} bundle install && #{command_prefix} bundle exec rspec")
    else
      exec(' bundle exec appraisal install && bundle exec rake appraisal spec')
   end
  else
    exec('bundle exec appraisal install && bundle exec rake appraisal spec')
  end
end


Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "gitflow #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
