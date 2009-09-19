require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Representative do
  before(:each) do
    @representative = Factory.build(:representative)
  end

  it "should create a new instance given valid attributes" do
    @representative.save.should == true
  end
  
  it "should be invalid without a name" do
    @representative.name = ""
    @representative.save.should == false
  end
  
  it "should be invalid without a cnpj_cpf" do
    @representative.cnpj_cpf = ""
    @representative.save.should == false
  end
  
  it "should be invalid with a duplicate name" do
    pending
  end
  
  it "should be invalid with a duplicate cnpj" do
    pending
  end  
  
  it "should be protected status attributes" do
    pending
  end
      
  #Dependent Representative
  describe "Dependent" do

    before(:each) do
      @representative.save!
      2.times{ @representative.dependent_representatives << Factory(:dependent_representative) }
    end
    
    it "should have a dependent_representatives method" do
      @representative.should respond_to(:dependent_representatives)
    end
    
    it "should has many dependent_representatives" do
      association = Representative.reflect_on_association(:dependent_representatives)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should have 2 dependent_representatives" do
      @representative.should have(2).dependent_representatives
    end
    
    it "should delete all dependent_representatives on destroy representative" do
      dependent_representatives = @representative.dependent_representatives
      @representative.destroy
      dependent_representatives.each do |dependent_representative|
        DependentRepresentative.find(dependent_representative).should be_nil
      end
    end
    
  end
  
  #Price Lists of Representative
  describe "Price Lists of Representative" do

    before(:each) do
      @representative.save!
      2.times{ @representative.price_lists << Factory(:price_list) }
    end
    
    it "should have price_lists method " do
      @representative.should respond_to(:price_lists)
    end
    
    it "should has and belongs to many associations with price_lists" do
      associations = Representative.reflect_on_association(:price_lists)
      associations.should_not be_nil
      associations.macro.should == :has_and_belongs_to_many
    end
    
    it "should delete all price_lists on destroy representative" do
      price_lists = @representative.price_lists
      @representative.destroy
      price_lists.each do |price_list|
        PriceList.find(price_list).should be_nil
      end
    end
    
  end
  
  #Carriers of Representative
  describe "Carriers of Representative" do
    
    before(:each) do
      @representative.save!
      2.times{ @representative.carriers << Factory(:carrier) }
    end
    
    it "should have carriers method " do
      @representative.should respond_to(:carriers)
    end
    
    it "should has and belongs to many associations with carriers" do
      associations = Representative.reflect_on_association(:carriers)
      associations.should_not be_nil
      associations.macro.should == :has_and_belongs_to_many
    end
    
    it "should delete all carriers on destroy representative" do
      carriers = @representative.carriers
      @representative.destroy
      carriers.each do |carrier|
        Carrier.find(carrier).should be_nil
      end
    end
  end
    
  #Customer
  describe "Customer" do
    
    before(:each) do
      @representative.save!
      2.times{ @representative.customers << Factory(:customer) }
    end
    
    it "should have customers method " do
      @representative.should respond_to(:customers)
    end
    
    it "should has many associations with customers" do
      associations = Representative.reflect_on_association(:customers)
      associations.should_not be_nil
      associations.macro.should == :has_many
    end
    
    it "should delete all customers on destroy representative" do
      customers = @representative.customers
      @representative.destroy
      customers.each do |customer|
        Customer.find(customer).should be_nil
      end
    end    
    
  end
  
  #Solicitation
  describe "Solicitation" do

    before(:each) do
      @representative.save!
      2.times{ @representative.solicitations << Factory(:solicitation) }
    end
    
    it "should have a solicitations method" do
      @representative.should respond_to(:solicitations)
    end
    
    it "should has many solicitations" do
      association = Representative.reflect_on_association(:solicitations)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should have 2 solicitations" do
      @representative.should have(2).solicitations
    end
    
    it "should delete all solicitations on destroy representative" do
      solicitations = @representative.solicitations
      @representative.destroy
      solicitations.each do |solicitation|
        Solicitation.find(solicitation).should be_nil
      end
    end
    
  end  
  
end
