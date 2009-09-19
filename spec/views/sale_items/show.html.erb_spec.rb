require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sale_items/show.html.erb" do
  include SaleItemsHelper
  before(:each) do
    assigns[:sale_item] = @sale_item = stub_model(SaleItem)
  end

  it "renders attributes in <p>" do
    render
  end
end
