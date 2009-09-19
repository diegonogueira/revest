require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/payment_forms/show.html.erb" do
  include PaymentFormsHelper
  before(:each) do
    assigns[:payment_form] = @payment_form = stub_model(PaymentForm)
  end

  it "renders attributes in <p>" do
    render
  end
end
