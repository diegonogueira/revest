require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carriers/edit.html.erb" do
  include CarriersHelper

  before(:each) do
    assigns[:carrier] = @carrier = stub_model(Carrier,
      :new_record? => false
    )
  end

  it "renders the edit carrier form" do
    render

    response.should have_tag("form[action=#{carrier_path(@carrier)}][method=post]") do
    end
  end
end
