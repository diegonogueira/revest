require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/price_lists/show.html.erb" do
  include PriceListsHelper
  before(:each) do
    assigns[:price_list] = @price_list = stub_model(PriceList)
  end

  it "renders attributes in <p>" do
    render
  end
end
