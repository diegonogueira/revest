require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lines/show.html.erb" do
  include LinesHelper
  before(:each) do
    assigns[:line] = @line = stub_model(Line)
  end

  it "renders attributes in <p>" do
    render
  end
end
