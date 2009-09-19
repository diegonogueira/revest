require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Photo do
  before(:each) do
    product = Factory(:product)
    @photo = Factory(:photo, :photograph => product)
  end

  it "should create a new instance given valid attributes" do
    @photo.save.should == true
  end
  
  it "should be invalid without a image_file_name" do
    @photo.image_file_name = ""
    @photo.save.should == false
  end
  
  it "should be invalid without a image_updated_at" do
    @photo.image_updated_at = ""
    @photo.save.should == false
  end

  it "should be invalid without a image_file_size" do
    @photo.image_file_size = ""
    @photo.save.should == false
  end
  
  #Product-----------------------------------------------------  
  describe "Product" do
    
    it "should have a photograph method" do
      @photo.should respond_to(:photograph)
    end
    
    it "should belongs_to product" do
      association = Photo.reflect_on_association(:photograph)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 product" do
      @photo.photograph.should_not be_nil
    end
        
  end
  
end
