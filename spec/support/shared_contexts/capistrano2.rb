require 'capistrano'
require 'capistrano/gitflow'

require_relative '../../capistrano2/spec_helper'
require_relative '../matchers/capistrano2'

class MockCLI
    attr_reader :options

    def initialize
      @options = {}
    end

    include Capistrano::CLI::Execute
  end


shared_context 'capistrano2' do
  include Capistrano::Spec::Matchers

  let(:capistrano)  { Capistrano::Configuration.instance }
  let(:recipe_name) { self.class.top_level_description }
  let(:recipe_path) { recipe(recipe_name) }
  let(:kernel) { TOPLEVEL_BINDING.eval "self" }
  subject           { capistrano }

  before(:each) do
    capistrano.extend Capistrano::Spec::ConfigurationExtension
    capistrano.load recipe_path
  end

  let(:task) do
    capistrano.find_task(recipe_name) or raise "Task #{task} not found"
  end


  def recipe name
    Dir[File.join(root, "lib/capistrano/tasks/**/*.rb")].find do |recipe|
      File.basename(recipe, '.rb') == name
    end
  end
end
