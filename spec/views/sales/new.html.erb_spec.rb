require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sales/new.html.erb" do
  include SalesHelper

  before(:each) do
    assigns[:sale] = stub_model(Sale,
      :new_record? => true
    )
  end

  it "renders new sale form" do
    render

    response.should have_tag("form[action=?][method=post]", sales_path) do
    end
  end
end
