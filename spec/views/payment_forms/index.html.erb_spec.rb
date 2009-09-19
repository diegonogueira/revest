require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/payment_forms/index.html.erb" do
  include PaymentFormsHelper

  before(:each) do
    assigns[:payment_forms] = [
      stub_model(PaymentForm),
      stub_model(PaymentForm)
    ]
  end

  it "renders a list of payment_forms" do
    render
  end
end
