require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/payment_forms/edit.html.erb" do
  include PaymentFormsHelper

  before(:each) do
    assigns[:payment_form] = @payment_form = stub_model(PaymentForm,
      :new_record? => false
    )
  end

  it "renders the edit payment_form form" do
    render

    response.should have_tag("form[action=#{payment_form_path(@payment_form)}][method=post]") do
    end
  end
end
