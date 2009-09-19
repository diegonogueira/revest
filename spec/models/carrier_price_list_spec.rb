require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CarrierPriceList do
  before(:each) do
    @carrier_price_list = Factory.build(:carrier_price_list)
  end

  it "should create a new instance given valid attributes" do
    @carrier_price_list.save.should == true
  end
  
  it "should be invalid without a name" do
    @carrier_price_list.name = ""
    @carrier_price_list.save.should == false
  end
  
  #Carrier
  describe "Carrier" do
    
    it "should have a carrier method" do
      @carrier_price_list.should respond_to(:carrier)
    end
    
    it "should belongs_to carrier" do
      association = CarrierPriceList.reflect_on_association(:carrier)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 carrier" do
      @carrier_price_list.carrier.should_not be_nil
    end    
    
  end
  
end
