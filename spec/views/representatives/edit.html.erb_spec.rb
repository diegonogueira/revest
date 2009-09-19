require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/representatives/edit.html.erb" do
  include RepresentativesHelper

  before(:each) do
    assigns[:representative] = @representative = stub_model(Representative,
      :new_record? => false
    )
  end

  it "renders the edit representative form" do
    render

    response.should have_tag("form[action=#{representative_path(@representative)}][method=post]") do
    end
  end
end
