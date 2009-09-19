require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Carrier do
  before(:each) do
    @carrier = Factory.build(:carrier)
  end

  it "should create a new instance given valid attributes" do
    @carrier.save.should == true
  end
  
  it "should be invalid without a name" do
    @carrier.name = ""
    @carrier.save.should == false
  end
  
  it "should be invalid with a duplicate name" do
    pending
  end 
  
  #Representative
  describe "Representative" do

    before(:each) do
      @carrier = Factory.build(:carrier)
      @carrier.representatives << Factory(:representative)
    end
    
    it "should have representatives method " do
      @carrier.should respond_to(:representatives)
    end
    
    it "should has and belongs to many association with representative" do
      associations = Carrier.reflect_on_association(:representatives)
      associations.should_not be_nil
      associations.macro.should == :has_and_belongs_to_many
    end
        
  end  
  
  #Carrier Price List-----------------------------------------------------
  describe "Carrier Price List" do

    before(:each) do
      @carrier.save!
      2.times{ @carrier.carrier_price_lists << Factory(:carrier_price_list) }
    end

    it "should have a carrier_price_lists method" do
      @carrier.should respond_to(:carrier_price_lists)
    end
    
    it "should has_many carrier_price_lists" do
      association = Carrier.reflect_on_association(:carrier_price_lists)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should delete all carrier_price_lists on destroy carrier" do
      @carrier.save!
      carrier_price_lists = @carrier.carrier_price_lists
      @carrier.destroy
      carrier_price_lists.each do |carrier_price_list|
        CarrierPriceList.find(carrier_price_list).should be_nil
      end
    end
    
    it "should be return 2 carrier_price_lists" do
      @carrier.should have(2).carrier_price_lists
    end
    
  end  
  
end
