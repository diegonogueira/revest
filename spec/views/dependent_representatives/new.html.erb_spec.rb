require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dependent_representatives/new.html.erb" do
  include DependentRepresentativesHelper

  before(:each) do
    assigns[:dependent_representative] = stub_model(DependentRepresentative,
      :new_record? => true
    )
  end

  it "renders new dependent_representative form" do
    render

    response.should have_tag("form[action=?][method=post]", dependent_representatives_path) do
    end
  end
end
