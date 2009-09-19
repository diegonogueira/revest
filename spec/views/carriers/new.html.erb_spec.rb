require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carriers/new.html.erb" do
  include CarriersHelper

  before(:each) do
    assigns[:carrier] = stub_model(Carrier,
      :new_record? => true
    )
  end

  it "renders new carrier form" do
    render

    response.should have_tag("form[action=?][method=post]", carriers_path) do
    end
  end
end
