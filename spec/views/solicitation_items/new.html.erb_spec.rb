require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solicitation_items/new.html.erb" do
  include SolicitationItemsHelper

  before(:each) do
    assigns[:solicitation_item] = stub_model(SolicitationItem,
      :new_record? => true
    )
  end

  it "renders new solicitation_item form" do
    render

    response.should have_tag("form[action=?][method=post]", solicitation_items_path) do
    end
  end
end
