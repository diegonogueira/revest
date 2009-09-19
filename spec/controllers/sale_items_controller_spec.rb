require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SaleItemsController do

  def mock_sale_item(stubs={})
    @mock_sale_item ||= mock_model(SaleItem, stubs)
  end

  describe "GET index" do
    it "assigns all sale_items as @sale_items" do
      SaleItem.stub!(:find).with(:all).and_return([mock_sale_item])
      get :index
      assigns[:sale_items].should == [mock_sale_item]
    end
  end

  describe "GET show" do
    it "assigns the requested sale_item as @sale_item" do
      SaleItem.stub!(:find).with("37").and_return(mock_sale_item)
      get :show, :id => "37"
      assigns[:sale_item].should equal(mock_sale_item)
    end
  end

  describe "GET new" do
    it "assigns a new sale_item as @sale_item" do
      SaleItem.stub!(:new).and_return(mock_sale_item)
      get :new
      assigns[:sale_item].should equal(mock_sale_item)
    end
  end

  describe "GET edit" do
    it "assigns the requested sale_item as @sale_item" do
      SaleItem.stub!(:find).with("37").and_return(mock_sale_item)
      get :edit, :id => "37"
      assigns[:sale_item].should equal(mock_sale_item)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created sale_item as @sale_item" do
        SaleItem.stub!(:new).with({'these' => 'params'}).and_return(mock_sale_item(:save => true))
        post :create, :sale_item => {:these => 'params'}
        assigns[:sale_item].should equal(mock_sale_item)
      end

      it "redirects to the created sale_item" do
        SaleItem.stub!(:new).and_return(mock_sale_item(:save => true))
        post :create, :sale_item => {}
        response.should redirect_to(sale_item_url(mock_sale_item))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sale_item as @sale_item" do
        SaleItem.stub!(:new).with({'these' => 'params'}).and_return(mock_sale_item(:save => false))
        post :create, :sale_item => {:these => 'params'}
        assigns[:sale_item].should equal(mock_sale_item)
      end

      it "re-renders the 'new' template" do
        SaleItem.stub!(:new).and_return(mock_sale_item(:save => false))
        post :create, :sale_item => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested sale_item" do
        SaleItem.should_receive(:find).with("37").and_return(mock_sale_item)
        mock_sale_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sale_item => {:these => 'params'}
      end

      it "assigns the requested sale_item as @sale_item" do
        SaleItem.stub!(:find).and_return(mock_sale_item(:update_attributes => true))
        put :update, :id => "1"
        assigns[:sale_item].should equal(mock_sale_item)
      end

      it "redirects to the sale_item" do
        SaleItem.stub!(:find).and_return(mock_sale_item(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(sale_item_url(mock_sale_item))
      end
    end

    describe "with invalid params" do
      it "updates the requested sale_item" do
        SaleItem.should_receive(:find).with("37").and_return(mock_sale_item)
        mock_sale_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sale_item => {:these => 'params'}
      end

      it "assigns the sale_item as @sale_item" do
        SaleItem.stub!(:find).and_return(mock_sale_item(:update_attributes => false))
        put :update, :id => "1"
        assigns[:sale_item].should equal(mock_sale_item)
      end

      it "re-renders the 'edit' template" do
        SaleItem.stub!(:find).and_return(mock_sale_item(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested sale_item" do
      SaleItem.should_receive(:find).with("37").and_return(mock_sale_item)
      mock_sale_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sale_items list" do
      SaleItem.stub!(:find).and_return(mock_sale_item(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(sale_items_url)
    end
  end

end
