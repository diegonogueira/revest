require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/representatives/index.html.erb" do
  include RepresentativesHelper

  before(:each) do
    assigns[:representatives] = [
      stub_model(Representative),
      stub_model(Representative)
    ]
  end

  it "renders a list of representatives" do
    render
  end
end
