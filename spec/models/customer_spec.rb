require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Customer do
  before(:each) do
    @customer = Factory.build(:customer)
  end

  it "should create a new instance given valid attributes" do
    @customer.save.should == true
  end
  
  it "should be invalid without a name" do
    @customer.name = ""
    @customer.save.should == false
  end
  
  it "should be invalid without a cnpj_cpf" do
    @customer.cnpj_cpf = ""
    @customer.save.should == false
  end
  
  it "should not duplicate name" do
    pending    
  end
  
  it "should not duplicate cnpj_cpf" do
    pending    
  end
  
  #Representative
  describe "Representative" do
    
    it "should respond representative method" do
      @customer.should respond_to(:representative)
    end
    
    it "should belongs to representative association" do
      association = Customer.reflect_on_association(:representative)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 representative" do
      @customer.save!
      @customer.representative.should_not be_nil
    end
    
  end
  
  #Solicitation
  describe "Solicitation" do

    before(:each) do
      @customer.save!
      2.times{ @customer.solicitations << Factory(:solicitation) }
    end
    
    it "should have a solicitations method" do
      @customer.should respond_to(:solicitations)
    end
    
    it "should has many solicitations" do
      association = Customer.reflect_on_association(:solicitations)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should have 2 solicitations" do
      @customer.should have(2).solicitations
    end
        
  end    
  
end
