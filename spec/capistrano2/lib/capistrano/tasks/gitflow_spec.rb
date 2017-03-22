require 'spec_helper'
require File.join(root, 'spec', 'support', 'shared_contexts', 'capistrano2')

# describe "gitflow:calculate_tag" do
#   include_context 'rake'
#
#   it "executes the gitflow_calculate_tag from the helper using Kernel" do
#     expect(kernel).to receive(:gitflow_calculate_tag).and_return(true)
#     subject.invoke
#   end
#
# end
#
# describe "gitflow:verify_up_to_date" do
#   include_context 'rake'
#
#   it "executes the gitflow_verify_up_to_date from the helper using Kernel" do
#     expect(kernel).to receive(:gitflow_verify_up_to_date).and_return(true)
#     subject.invoke
#   end
#
# end

# describe "gitflow:tag_staging" do
#   include_context 'rake'
#
#   it "executes the gitflow_tag_staging from the helper using Kernel" do
#     expect(kernel).to receive(:gitflow_tag_staging).and_return(true)
#     subject.invoke
#   end
#
# end
#
#
# describe "gitflow:tag_production" do
#   include_context 'rake'
#
#   it "executes the gitflow_tag_production from the helper using Kernel" do
#     expect(kernel).to receive(:gitflow_tag_production).and_return(true)
#     subject.invoke
#   end
#
# end
#
# describe "deploy:pending:compare" do
#   include_context 'rake'
#
#   it "executes the gitflow_execute_task  from the helper using Kernel " do
#     expect(kernel).to receive(:gitflow_execute_task).with("gitflow:commit_log").and_return(true)
#     subject.invoke
#   end
#
# end
#
#
describe "gitflow" do
  include_context 'capistrano2'

  it "executes the task gitflow_callbacks from the helper using Kernel" do
    expect(kernel).to receive(:gitflow_callbacks).and_return(true)
    task.invoke
  end

end
