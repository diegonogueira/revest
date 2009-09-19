require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solicitation_items/show.html.erb" do
  include SolicitationItemsHelper
  before(:each) do
    assigns[:solicitation_item] = @solicitation_item = stub_model(SolicitationItem)
  end

  it "renders attributes in <p>" do
    render
  end
end
