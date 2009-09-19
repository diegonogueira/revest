require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/price_lists/new.html.erb" do
  include PriceListsHelper

  before(:each) do
    assigns[:price_list] = stub_model(PriceList,
      :new_record? => true
    )
  end

  it "renders new price_list form" do
    render

    response.should have_tag("form[action=?][method=post]", price_lists_path) do
    end
  end
end
