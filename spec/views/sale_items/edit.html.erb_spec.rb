require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sale_items/edit.html.erb" do
  include SaleItemsHelper

  before(:each) do
    assigns[:sale_item] = @sale_item = stub_model(SaleItem,
      :new_record? => false
    )
  end

  it "renders the edit sale_item form" do
    render

    response.should have_tag("form[action=#{sale_item_path(@sale_item)}][method=post]") do
    end
  end
end
