require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Product do
  before(:each) do
    @product = Factory.build(:product)
  end

  it "should create a new instance given valid attributes" do
    @product.save.should == true
  end
  
  it "should be invalid without name" do
    @product.name = ""
    @product.save.should == false
  end
  
  it "should be invalid without name" do
    @product.line_id = ""
    @product.save.should == false
  end
  
  it "should be invalid with a duplicate name and line" do
    pending
  end    

  #LINES-----------------------------------------------------
  describe "Lines" do

    it "should have a line method" do
      @product.save!
      @product.should respond_to(:line)
    end
    
    it "should belongs to a line" do
      @product.save!
      association = Product.reflect_on_association(:line)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    
    it "should have 1 line" do
      @product.save!
      @product.line.should_not be_nil
    end
    
  end
  
  #Photos-----------------------------------------------------
  describe "Photos" do

    before(:each) do
      @product.save!
      2.times{ @product.photos << Factory(:photo, :photograph => @product) }
    end

    it "should have a photos method" do
      @product.should respond_to(:photos)
    end
    
    it "should has_many photos" do
      association = Product.reflect_on_association(:photos)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should delete all photo on destroy product" do
      @product.save!
      photos = @product.photos
      @product.destroy
      photos.each do |photo|
        Photo.find(photo).should be_nil
      end
    end
    
    it "should be return 2 photos" do
      @product.should have(2).photos
    end
    
  end
  
  #Solicitation item
  describe "Solicitation Item" do

    before(:each) do
      @product.save!
      2.times { @product.solicitation_items << Factory(:solicitation_item) }
    end
    
    it "should have a solicitation_items method" do
      @product.should respond_to(:solicitation_items)
    end
    
    it "should has many solicitation_items" do
      association = Product.reflect_on_association(:solicitation_items)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    
    it "should have 2 solicitation_item" do
      @product.should have(2).solicitation_items
    end
    
    it "should delete all solicitation_items on destroy representative" do
      solicitation_items = @product.solicitation_items
      @product.destroy
      solicitation_items.each do |solicitation_item|
        SolicitationItem.find(solicitation_item).should be_nil
      end
    end
    
  end      
  
end
