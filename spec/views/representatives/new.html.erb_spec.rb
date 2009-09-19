require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/representatives/new.html.erb" do
  include RepresentativesHelper

  before(:each) do
    assigns[:representative] = stub_model(Representative,
      :new_record? => true
    )
  end

  it "renders new representative form" do
    render

    response.should have_tag("form[action=?][method=post]", representatives_path) do
    end
  end
end
