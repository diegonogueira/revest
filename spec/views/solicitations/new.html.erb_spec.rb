require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solicitations/new.html.erb" do
  include SolicitationsHelper

  before(:each) do
    assigns[:solicitation] = stub_model(Solicitation,
      :new_record? => true
    )
  end

  it "renders new solicitation form" do
    render

    response.should have_tag("form[action=?][method=post]", solicitations_path) do
    end
  end
end
