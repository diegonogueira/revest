require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solicitations/edit.html.erb" do
  include SolicitationsHelper

  before(:each) do
    assigns[:solicitation] = @solicitation = stub_model(Solicitation,
      :new_record? => false
    )
  end

  it "renders the edit solicitation form" do
#    render

#    response.should have_tag("form[action=#{representative_solicitation_path(@representative,@solicitation)}][method=post]") do
#    end
  end
end
