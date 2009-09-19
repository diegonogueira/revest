require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carrier_price_lists/new.html.erb" do
  include CarrierPriceListsHelper

  before(:each) do
    assigns[:carrier_price_list] = stub_model(CarrierPriceList,
      :new_record? => true
    )
  end

  it "renders new carrier_price_list form" do
    render

    response.should have_tag("form[action=?][method=post]", carrier_price_lists_path) do
    end
  end
end
