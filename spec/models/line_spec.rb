require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Line do
  before(:each) do
    @line = Factory.build(:line)
  end

  it "should create a new instance given valid attributes" do
    @line.save.should == true
  end
  
  it "should be invalid without a name" do
    @line.name = ""
    @line.save.should == false
  end
  
  it "should be invalid with a duplicate name" do
    pending
  end  
  
  #Product-----------------------------------------------------
  describe "Product" do

    before(:each) do
      @line.save!
      @line.products << Factory(:product, :line => @line)
    end

    it "should have a products method" do
      @line.save!
      @line.should respond_to(:products)
    end
    
    it "should has many products" do
      @line.save!
      association = Line.reflect_on_association(:products)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should have 1 product" do
      @line.save!
      @line.products.should have(1).product
    end
    
  end  
  
end
