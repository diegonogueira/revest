require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Solicitation do
  before(:each) do
    @solicitation = Factory.build(:solicitation )
  end

  it "should create a new instance given valid attributes" do
    @solicitation.save.should == true
  end
 
  #Representative
  describe "Representative" do
    
    it "should respond representative method" do
      @solicitation.should respond_to(:representative)
    end
    
    it "should belongs to representative association" do
      association = Solicitation.reflect_on_association(:representative)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 representative" do
      @solicitation.save!
      @solicitation.representative.should_not be_nil
    end
    
  end
  
  #Customer
  describe "Customer" do
    
    it "should respond customer method" do
      @solicitation.should respond_to(:customer)
    end
    
    it "should belongs to customer association" do
      association = Solicitation.reflect_on_association(:customer)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 customer" do
      @solicitation.save!
      @solicitation.customer.should_not be_nil
    end
    
  end  
  
  #Solicitation item
  describe "Solicitation Item" do

    before(:each) do
      @solicitation.save!
       2.times { @solicitation.solicitation_items << Factory(:solicitation_item)}
    end
    
    it "should have a solicitation_items method" do
      @solicitation.should respond_to(:solicitation_items)
    end
    
    it "should has many solicitation_items" do
      association = Solicitation.reflect_on_association(:solicitation_items)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should have 2 solicitation_item" do
      @solicitation.should have(2).solicitation_items
    end
    
    it "should delete all solicitation_items on destroy representative" do
      solicitation_items = @solicitation.solicitation_items
      @solicitation.destroy
      solicitation_items.each do |solicitation_item|
        SolicitationItem.find(solicitation_item).should be_nil
      end
    end
    
  end    
  
  #Sale
  describe "Sale" do

    before(:each) do
      @solicitation.save!
      2.times { @solicitation.sales << Factory(:sale) }
    end
    
    it "should have a sales method" do
      @solicitation.should respond_to(:sales)
    end
    
    it "should has many sales" do
      association = Solicitation.reflect_on_association(:sales)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should have 2 solicitation_item" do
      @solicitation.should have(2).sale
    end
    
    it "should delete all sales on destroy representative" do
      sales = @solicitation.sales
      @solicitation.destroy
      sales.each do |sale|
        Sale.find(sale).should be_nil
      end
    end
    
  end
  
end
