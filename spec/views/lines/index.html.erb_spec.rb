require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lines/index.html.erb" do
  include LinesHelper

  before(:each) do
    assigns[:lines] = [
      stub_model(Line),
      stub_model(Line)
    ]
  end

  it "renders a list of lines" do
    render
  end
end
