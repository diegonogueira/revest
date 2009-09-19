require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/price_lists/index.html.erb" do
  include PriceListsHelper

  before(:each) do
    assigns[:price_lists] = [
      stub_model(PriceList),
      stub_model(PriceList)
    ]
  end

  it "renders a list of price_lists" do
    render
  end
end
