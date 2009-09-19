require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PaymentForm do
  before(:each) do
    @payment_form = Factory.build(:payment_form)
  end

  it "should create a new instance given valid attributes" do
    @payment_form.save.should == true
  end
  
  it "should be invalid without a name" do
    @payment_form.name = ""
    @payment_form.save.should == false
  end
  
  it "should be invalid with duplicate name" do
    pending
  end
  
end
