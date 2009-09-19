require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SolicitationItem do
  before(:each) do
    @solicitation_item = Factory.build(:solicitation_item)
  end

  it "should create a new instance given valid attributes" do
    @solicitation_item.save.should == true
  end
  
  #Solicitation
  describe "Solicitations" do
    
    it "should have a solicitation method" do
      @solicitation_item.should respond_to(:solicitation)
    end
    
    it "should belongs_to solicitation" do
      association = SolicitationItem.reflect_on_association(:solicitation)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 solicitation" do
      @solicitation_item.solicitation.should_not be_nil
    end    
    
  end
  
  #Product
  describe "Product" do
    
    it "should have a product method" do
      @solicitation_item.should respond_to(:product)
    end
    
    it "should belongs_to product" do
      association = SolicitationItem.reflect_on_association(:product)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 product" do
      @solicitation_item.product.should_not be_nil
    end    
    
  end
  
  #Price List
  describe "PriceList" do
    
    it "should have a price_list method" do
      @solicitation_item.should respond_to(:price_list)
    end
    
    it "should belongs_to price_list" do
      association = SolicitationItem.reflect_on_association(:price_list)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 price_list" do
      @solicitation_item.price_list.should_not be_nil
    end    
    
  end    
  
end
