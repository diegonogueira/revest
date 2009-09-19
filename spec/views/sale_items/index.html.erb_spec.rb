require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sale_items/index.html.erb" do
  include SaleItemsHelper

  before(:each) do
    assigns[:sale_items] = [
      stub_model(SaleItem),
      stub_model(SaleItem)
    ]
  end

  it "renders a list of sale_items" do
    render
  end
end
