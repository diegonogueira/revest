require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/representatives/show.html.erb" do
  include RepresentativesHelper
  before(:each) do
    assigns[:representative] = @representative = stub_model(Representative)
  end

  it "renders attributes in <p>" do
    render
  end
end
