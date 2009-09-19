require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sale_items/new.html.erb" do
  include SaleItemsHelper

  before(:each) do
    assigns[:sale_item] = stub_model(SaleItem,
      :new_record? => true
    )
  end

  it "renders new sale_item form" do
    render

    response.should have_tag("form[action=?][method=post]", sale_items_path) do
    end
  end
end
