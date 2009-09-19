require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carrier_price_lists/edit.html.erb" do
  include CarrierPriceListsHelper

  before(:each) do
    assigns[:carrier_price_list] = @carrier_price_list = stub_model(CarrierPriceList,
      :new_record? => false
    )
  end

  it "renders the edit carrier_price_list form" do
    render

    response.should have_tag("form[action=#{carrier_price_list_path(@carrier_price_list)}][method=post]") do
    end
  end
end
