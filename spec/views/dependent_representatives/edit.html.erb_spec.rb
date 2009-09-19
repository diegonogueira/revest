require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dependent_representatives/edit.html.erb" do
  include DependentRepresentativesHelper

  before(:each) do
    assigns[:dependent_representative] = @dependent_representative = stub_model(DependentRepresentative,
      :new_record? => false
    )
  end

  it "renders the edit dependent_representative form" do
    render

    response.should have_tag("form[action=#{dependent_representative_path(@dependent_representative)}][method=post]") do
    end
  end
end
