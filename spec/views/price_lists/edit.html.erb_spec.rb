require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/price_lists/edit.html.erb" do
  include PriceListsHelper

  before(:each) do
    assigns[:price_list] = @price_list = stub_model(PriceList,
      :new_record? => false
    )
  end

  it "renders the edit price_list form" do
    render

    response.should have_tag("form[action=#{price_list_path(@price_list)}][method=post]") do
    end
  end
end
