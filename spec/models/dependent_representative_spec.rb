require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DependentRepresentative do
  before(:each) do
    @dependent_representative = Factory.build(:dependent_representative)
  end

  it "should create a new instance given valid attributes" do
    @dependent_representative.save.should == true
  end

  it "should be invalid without a name" do
    @dependent_representative.name = ""
    @dependent_representative.save.should == false
  end
  
  #Representative
  describe "Representative" do

    before(:each) do
      @dependent_representative.save!
    end
    
    it "should have a representative method" do
      @dependent_representative.should respond_to(:representative)
    end
    
    it "should belongs_to representative" do
      association = DependentRepresentative.reflect_on_association(:representative)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 representative" do
      @dependent_representative.representative.should_not be_nil
    end    
    
  end
  
end
