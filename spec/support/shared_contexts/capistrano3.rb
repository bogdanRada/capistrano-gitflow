require_relative '../../spec_helper'

require 'capistrano/all'
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/gitflow'
# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

require_relative '../matchers/capistrano3'



shared_context 'capistrano3' do
  include Capistrano::Spec::Matchers

  let(:capistrano)  { Capistrano::Configuration.new }
  let(:recipe_name) { self.class.top_level_description }
  let(:recipe_path) { recipe(recipe_name) }
  let(:kernel) { TOPLEVEL_BINDING.eval "self" }
  subject         { Rake::Task[recipe_name] }
  #subject           { capistrano }

  before(:each) do
    capistrano.extend Capistrano::Spec::ConfigurationExtension
    capistrano.send(:load, recipe_path)
  end

  let(:task) do
    task = self.class.ancestors.map do |example|
      break $1 if /^(.+?) task$/ =~ example.description
    end

    if task
      task = "#{recipe_name}:#{task}"
      capistrano.find_task(task) or raise "Task #{task} not found"
    end
  end


  def recipe name
    Dir[File.join(root, "lib/capistrano/tasks/**/*.rb")].find do |recipe|
      File.basename(recipe, '.rb') == name
    end
  end
end
