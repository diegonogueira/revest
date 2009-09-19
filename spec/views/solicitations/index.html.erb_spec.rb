require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solicitations/index.html.erb" do
  include SolicitationsHelper

  before(:each) do
    assigns[:solicitations] = [
      stub_model(Solicitation),
      stub_model(Solicitation)
    ]
  end

  it "renders a list of solicitations" do
    render
  end
end
