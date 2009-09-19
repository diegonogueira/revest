require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carrier_price_lists/show.html.erb" do
  include CarrierPriceListsHelper
  before(:each) do
    assigns[:carrier_price_list] = @carrier_price_list = stub_model(CarrierPriceList)
  end

  it "renders attributes in <p>" do
    render
  end
end
