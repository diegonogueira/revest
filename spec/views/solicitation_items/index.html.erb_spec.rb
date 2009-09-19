require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solicitation_items/index.html.erb" do
  include SolicitationItemsHelper

  before(:each) do
    assigns[:solicitation_items] = [
      stub_model(SolicitationItem),
      stub_model(SolicitationItem)
    ]
  end

  it "renders a list of solicitation_items" do
    render
  end
end
