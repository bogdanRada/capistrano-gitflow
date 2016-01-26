require 'spec_helper'
require 'rake'

shared_context 'rake' do
  let(:rake)      { Rake::Application.new }
  let(:task_name) { self.class.top_level_description }
  let(:task_path) { File.join(root, "lib/capistrano/tasks/#{task_name.split(':').first}.rb") }
  subject         { rake[task_name] }
  let(:main_self) { TOPLEVEL_BINDING.eval "self" }

  before do
    Rake.application = rake
    Rake.application.add_import(File.join(root, 'spec/tasks.rake')) # fake deploy tasks used for testing
    Rake.application.add_import(task_path)
    Rake.application.load_imports
  end
end
