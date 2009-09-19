require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dependent_representatives/show.html.erb" do
  include DependentRepresentativesHelper
  before(:each) do
    assigns[:dependent_representative] = @dependent_representative = stub_model(DependentRepresentative)
  end

  it "renders attributes in <p>" do
    render
  end
end
