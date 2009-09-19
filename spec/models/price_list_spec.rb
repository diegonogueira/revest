require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PriceList do
  before(:each) do
    @price_list = Factory.build(:price_list)
  end

  it "should create a new instance given valid attributes" do
    @price_list.save.should == true
  end
  
  it "should be invalid without a name" do
    @price_list.name = ""
    @price_list.save.should == false
  end
  
  #Representatives
  describe "Representatives" do

    before(:each) do
      @price_list = Factory.build(:price_list)
      @price_list.representatives << Factory(:representative)
    end
    
    it "should have representatives method " do
      @price_list.should respond_to(:representatives)
    end
    
    it "should has and belongs to many association with representative" do
      associations = PriceList.reflect_on_association(:representatives)
      associations.should_not be_nil
      associations.macro.should == :has_and_belongs_to_many
    end
        
  end
  
  #Solicitation item
  describe "Solicitation Item" do

    before(:each) do
      @price_list.save!
      2.times { @price_list.solicitation_items << Factory(:solicitation_item) }
    end
    
    it "should have a solicitation_items method" do
      @price_list.should respond_to(:solicitation_items)
    end
    
    it "should has many solicitation_items" do
      association = PriceList.reflect_on_association(:solicitation_items)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should have 2 solicitation_item" do
      @price_list.should have(2).solicitation_items
    end
    
    it "should delete all solicitation_items on destroy representative" do
      solicitation_items = @price_list.solicitation_items
      @price_list.destroy
      solicitation_items.each do |solicitation_item|
        SolicitationItem.find(solicitation_item).should be_nil
      end
    end
    
  end      
  
end
