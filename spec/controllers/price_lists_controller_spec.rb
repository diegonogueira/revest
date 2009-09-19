require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PriceListsController do

  def mock_price_list(stubs={})
    @mock_price_list ||= mock_model(PriceList, stubs)
  end

  describe "GET index" do
    it "assigns all price_lists as @price_lists" do
      PriceList.stub!(:paginate).and_return([mock_price_list])
      get :index
      assigns[:price_lists].should == [mock_price_list]
    end
  end

  describe "GET show" do
    it "assigns the requested price_list as @price_list" do
      PriceList.stub!(:find).with("37").and_return(mock_price_list)
      get :show, :id => "37"
      assigns[:price_list].should equal(mock_price_list)
    end
  end

  describe "GET new" do
    it "assigns a new price_list as @price_list" do
      PriceList.stub!(:new).and_return(mock_price_list)
      get :new
      assigns[:price_list].should equal(mock_price_list)
    end
  end

  describe "GET edit" do
    it "assigns the requested price_list as @price_list" do
      PriceList.stub!(:find).with("37").and_return(mock_price_list)
      get :edit, :id => "37"
      assigns[:price_list].should equal(mock_price_list)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created price_list as @price_list" do
        PriceList.stub!(:new).with({'these' => 'params'}).and_return(mock_price_list(:save => true))
        post :create, :price_list => {:these => 'params'}
        assigns[:price_list].should equal(mock_price_list)
      end

      it "redirects to the created price_list" do
        PriceList.stub!(:new).and_return(mock_price_list(:save => true))
        post :create, :price_list => {}
        response.should redirect_to(price_lists_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved price_list as @price_list" do
        PriceList.stub!(:new).with({'these' => 'params'}).and_return(mock_price_list(:save => false))
        post :create, :price_list => {:these => 'params'}
        assigns[:price_list].should equal(mock_price_list)
      end

      it "re-renders the 'new' template" do
        PriceList.stub!(:new).and_return(mock_price_list(:save => false))
        post :create, :price_list => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested price_list" do
        PriceList.should_receive(:find).with("37").and_return(mock_price_list)
        mock_price_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :price_list => {:these => 'params'}
      end

      it "assigns the requested price_list as @price_list" do
        PriceList.stub!(:find).and_return(mock_price_list(:update_attributes => true))
        put :update, :id => "1"
        assigns[:price_list].should equal(mock_price_list)
      end

      it "redirects to the price_list" do
        PriceList.stub!(:find).and_return(mock_price_list(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(price_lists_url)
      end
    end

    describe "with invalid params" do
      it "updates the requested price_list" do
        PriceList.should_receive(:find).with("37").and_return(mock_price_list)
        mock_price_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :price_list => {:these => 'params'}
      end

      it "assigns the price_list as @price_list" do
        PriceList.stub!(:find).and_return(mock_price_list(:update_attributes => false))
        put :update, :id => "1"
        assigns[:price_list].should equal(mock_price_list)
      end

      it "re-renders the 'edit' template" do
        PriceList.stub!(:find).and_return(mock_price_list(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested price_list" do
      PriceList.should_receive(:find).with(:first,:conditions=>{:id=>"37"}).and_return(mock_price_list)
      mock_price_list.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the price_lists list" do
      PriceList.stub!(:find).and_return(mock_price_list(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(price_lists_url)
    end
  end

end
