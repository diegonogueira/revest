require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carriers/show.html.erb" do
  include CarriersHelper
  before(:each) do
    assigns[:carrier] = @carrier = stub_model(Carrier)
  end

  it "renders attributes in <p>" do
    render
  end
end
