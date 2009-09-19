require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SaleItem do
  before(:each) do
    @sale_item = Factory.build(:sale_item)
  end

  it "should create a new instance given valid attributes" do
    @sale_item.save.should == true
  end
  
  it "should be invalid without a sale" do
    @sale_item.sale_id = ""
    @sale_item.save.should == false
  end
  
  it "should be invalid without a solicitation_item" do
    @sale_item.solicitation_item_id = ""
    @sale_item.save.should == false
  end    
  
  #Sale
  describe "Sale" do
    
    it "should have a sale method" do
      @sale_item.should respond_to(:sale)
    end
    
    it "should belongs_to sale" do
      association = SaleItem.reflect_on_association(:sale)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 sale" do
      @sale_item.sale.should_not be_nil
    end    
    
  end
  
  #SolicitationItem
  describe "SolicitationItem" do
    
    it "should have a solicitation_item method" do
      @sale_item.should respond_to(:solicitation_item)
    end
    
    it "should belongs_to solicitation_item" do
      association = SaleItem.reflect_on_association(:solicitation_item)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 solicitation_item" do
      @sale_item.solicitation_item.should_not be_nil
    end
    
  end    
  
end
