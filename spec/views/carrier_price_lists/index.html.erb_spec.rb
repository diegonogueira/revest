require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carrier_price_lists/index.html.erb" do
  include CarrierPriceListsHelper

  before(:each) do
    assigns[:carrier_price_lists] = [
      stub_model(CarrierPriceList),
      stub_model(CarrierPriceList)
    ]
  end

  it "renders a list of carrier_price_lists" do
    render
  end
end
