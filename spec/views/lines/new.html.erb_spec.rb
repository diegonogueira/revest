require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lines/new.html.erb" do
  include LinesHelper

  before(:each) do
    assigns[:line] = stub_model(Line,
      :new_record? => true
    )
  end

  it "renders new line form" do
    render

    response.should have_tag("form[action=?][method=post]", lines_path) do
    end
  end
end
