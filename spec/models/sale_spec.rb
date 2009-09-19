require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sale do
  before(:each) do
    representative = Factory(:representative)
    customer = Factory(:customer, :representative => representative)
    @sale = Factory.build(:sale, 
      :solicitation => Factory(:solicitation, :representative => representative, :customer => customer))
  end

  it "should create a new instance given valid attributes" do
    @sale.save.should == true
  end
  
  it "should be invalid without solicitation_id" do
    @sale.solicitation_id = ""
    @sale.save.should == false
  end
  
  it "should be invalid without sale_date" do
    @sale.sale_date = ""
    @sale.save.should == false
  end
  
  it "should be invalid without invoice" do
    @sale.invoice = ""
    @sale.save.should == false
  end
  
  #Solicitation
  describe "Solicitation" do
    
    it "should have a solicitation method" do
      @sale.save!
      @sale.should respond_to(:solicitation)
    end
    
    it "should belongs to a solicitation" do
      @sale.save!
      association = Sale.reflect_on_association(:solicitation)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 solicitations" do
      @sale.save!
      @sale.solicitation.should_not be_nil
    end
    
  end
    
  #Sale item
  describe "Sale Item" do

    before(:each) do
      @sale.save!
      2.times { @sale.sale_items << Factory(:sale_item ) }
    end
    
    it "should have a sale_items method" do
      @sale.should respond_to(:sale_items)
    end
    
    it "should has many sale_items" do
      association = Sale.reflect_on_association(:sale_items)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should have 2 sale_items" do
      @sale.should have(2).sale_items
    end
    
    it "should delete all sale_items on destroy sale" do
      sale_items = @sale.sale_items
      @sale.destroy
      sale_items.each do |sale_item|
        SaleItem.find(sale_item).should be_nil
      end
    end
    
  end      
  
end
