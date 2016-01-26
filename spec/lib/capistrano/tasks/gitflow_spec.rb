require 'spec_helper'

describe "gitflow:verify_up_to_date" do
  include_context 'rake'

  it "executes the gitflow_verify_up_to_date from the helper using Kernel" do
    main_self.expects(:gitflow_verify_up_to_date).returns(true)
    subject.invoke
  end

end

describe "gitflow:calculate_tag" do
  include_context 'rake'

  it "executes the gitflow_calculate_tag from the helper using Kernel" do
    main_self.expects(:gitflow_calculate_tag).returns(true)
    subject.invoke
  end

end

describe "gitflow:tag_staging" do
  include_context 'rake'

  it "executes the gitflow_tag_staging from the helper using Kernel" do
    main_self.stubs(:gitflow_tag_staging).returns(true)
    subject.invoke
  end

end


describe "gitflow:tag_production" do
  include_context 'rake'

  it "executes the gitflow_tag_production from the helper using Kernel" do
    main_self.expects(:gitflow_tag_production).returns(true)
    subject.invoke
  end

end

describe "deploy:pending:compare" do
  include_context 'rake'

  it "executes the gitflow_execute_task  from the helper using Kernel " do
    main_self.expects(:gitflow_execute_task).with("gitflow:commit_log").returns(true)
    subject.invoke
  end

end


describe "gitflow" do
  include_context 'rake'

  it "executes the gitflow_callbacks from the helper using Kernel" do
    main_self.expects(:gitflow_callbacks).returns(true)
    subject.invoke
  end

end
