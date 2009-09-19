require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solicitation_items/edit.html.erb" do
  include SolicitationItemsHelper

  before(:each) do
    assigns[:solicitation_item] = @solicitation_item = stub_model(SolicitationItem,
      :new_record? => false
    )
  end

  it "renders the edit solicitation_item form" do
    render

    response.should have_tag("form[action=#{solicitation_item_path(@solicitation_item)}][method=post]") do
    end
  end
end
