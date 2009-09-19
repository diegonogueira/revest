require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sales/index.html.erb" do
  include SalesHelper

  before(:each) do
    assigns[:sales] = [
      stub_model(Sale),
      stub_model(Sale)
    ]
  end

  it "renders a list of sales" do
    render
  end
end
