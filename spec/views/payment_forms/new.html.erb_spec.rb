require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/payment_forms/new.html.erb" do
  include PaymentFormsHelper

  before(:each) do
    assigns[:payment_form] = stub_model(PaymentForm,
      :new_record? => true
    )
  end

  it "renders new payment_form form" do
    render

    response.should have_tag("form[action=?][method=post]", payment_forms_path) do
    end
  end
end
