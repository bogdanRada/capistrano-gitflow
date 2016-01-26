require 'spec_helper'

shared_context 'rake' do
  let(:rake)      { Rake.application }
  let(:task_name) { self.class.top_level_description }
  subject         { Rake::Task[task_name] }
  let(:main_self) { TOPLEVEL_BINDING.eval "self" }

  
end
