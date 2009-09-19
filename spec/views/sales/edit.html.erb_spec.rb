require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sales/edit.html.erb" do
  include SalesHelper

  before(:each) do
    assigns[:sale] = @sale = stub_model(Sale,
      :new_record? => false
    )
  end

  it "renders the edit sale form" do
    render

    response.should have_tag("form[action=#{sale_path(@sale)}][method=post]") do
    end
  end
end
