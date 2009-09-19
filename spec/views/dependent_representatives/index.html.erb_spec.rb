require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dependent_representatives/index.html.erb" do
  include DependentRepresentativesHelper

  before(:each) do
    assigns[:dependent_representatives] = [
      stub_model(DependentRepresentative),
      stub_model(DependentRepresentative)
    ]
  end

  it "renders a list of dependent_representatives" do
    render
  end
end
