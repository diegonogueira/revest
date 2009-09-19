require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sales/show.html.erb" do
  include SalesHelper
  before(:each) do
    assigns[:sale] = @sale = stub_model(Sale)
  end

  it "renders attributes in <p>" do
    render
  end
end
