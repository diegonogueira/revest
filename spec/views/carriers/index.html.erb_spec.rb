require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carriers/index.html.erb" do
  include CarriersHelper

  before(:each) do
    assigns[:carriers] = [
      stub_model(Carrier),
      stub_model(Carrier)
    ]
  end

  it "renders a list of carriers" do
    render
  end
end
