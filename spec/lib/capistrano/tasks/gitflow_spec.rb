require 'spec_helper'

describe "gitflow:verify_up_to_date" do
  include_context 'rake'

  it "executes the gitflow_verify_up_to_date from the helper using Kernel" do
    main_self.expects(:gitflow_verify_up_to_date).returns(true)
    subject.invoke
  end

end
