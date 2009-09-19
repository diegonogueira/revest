require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lines/edit.html.erb" do
  include LinesHelper

  before(:each) do
    assigns[:line] = @line = stub_model(Line,
      :new_record? => false
    )
  end

  it "renders the edit line form" do
    render

    response.should have_tag("form[action=#{line_path(@line)}][method=post]") do
    end
  end
end
