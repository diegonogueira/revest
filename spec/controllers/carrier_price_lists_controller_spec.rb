require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CarrierPriceListsController do

  def mock_carrier_price_list(stubs={})
    @mock_carrier_price_list ||= mock_model(CarrierPriceList, stubs)
  end

  describe "GET index" do
    it "assigns all carrier_price_lists as @carrier_price_lists" do
      CarrierPriceList.stub!(:find).with(:all).and_return([mock_carrier_price_list])
      get :index
      assigns[:carrier_price_lists].should == [mock_carrier_price_list]
    end
  end

  describe "GET show" do
    it "assigns the requested carrier_price_list as @carrier_price_list" do
      CarrierPriceList.stub!(:find).with("37").and_return(mock_carrier_price_list)
      get :show, :id => "37"
      assigns[:carrier_price_list].should equal(mock_carrier_price_list)
    end
  end

  describe "GET new" do
    it "assigns a new carrier_price_list as @carrier_price_list" do
      CarrierPriceList.stub!(:new).and_return(mock_carrier_price_list)
      get :new
      assigns[:carrier_price_list].should equal(mock_carrier_price_list)
    end
  end

  describe "GET edit" do
    it "assigns the requested carrier_price_list as @carrier_price_list" do
      CarrierPriceList.stub!(:find).with("37").and_return(mock_carrier_price_list)
      get :edit, :id => "37"
      assigns[:carrier_price_list].should equal(mock_carrier_price_list)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created carrier_price_list as @carrier_price_list" do
        CarrierPriceList.stub!(:new).with({'these' => 'params'}).and_return(mock_carrier_price_list(:save => true))
        post :create, :carrier_price_list => {:these => 'params'}
        assigns[:carrier_price_list].should equal(mock_carrier_price_list)
      end

      it "redirects to the created carrier_price_list" do
        CarrierPriceList.stub!(:new).and_return(mock_carrier_price_list(:save => true))
        post :create, :carrier_price_list => {}
        response.should redirect_to(carrier_price_list_url(mock_carrier_price_list))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved carrier_price_list as @carrier_price_list" do
        CarrierPriceList.stub!(:new).with({'these' => 'params'}).and_return(mock_carrier_price_list(:save => false))
        post :create, :carrier_price_list => {:these => 'params'}
        assigns[:carrier_price_list].should equal(mock_carrier_price_list)
      end

      it "re-renders the 'new' template" do
        CarrierPriceList.stub!(:new).and_return(mock_carrier_price_list(:save => false))
        post :create, :carrier_price_list => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested carrier_price_list" do
        CarrierPriceList.should_receive(:find).with("37").and_return(mock_carrier_price_list)
        mock_carrier_price_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :carrier_price_list => {:these => 'params'}
      end

      it "assigns the requested carrier_price_list as @carrier_price_list" do
        CarrierPriceList.stub!(:find).and_return(mock_carrier_price_list(:update_attributes => true))
        put :update, :id => "1"
        assigns[:carrier_price_list].should equal(mock_carrier_price_list)
      end

      it "redirects to the carrier_price_list" do
        CarrierPriceList.stub!(:find).and_return(mock_carrier_price_list(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(carrier_price_list_url(mock_carrier_price_list))
      end
    end

    describe "with invalid params" do
      it "updates the requested carrier_price_list" do
        CarrierPriceList.should_receive(:find).with("37").and_return(mock_carrier_price_list)
        mock_carrier_price_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :carrier_price_list => {:these => 'params'}
      end

      it "assigns the carrier_price_list as @carrier_price_list" do
        CarrierPriceList.stub!(:find).and_return(mock_carrier_price_list(:update_attributes => false))
        put :update, :id => "1"
        assigns[:carrier_price_list].should equal(mock_carrier_price_list)
      end

      it "re-renders the 'edit' template" do
        CarrierPriceList.stub!(:find).and_return(mock_carrier_price_list(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested carrier_price_list" do
      CarrierPriceList.should_receive(:find).with("37").and_return(mock_carrier_price_list)
      mock_carrier_price_list.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the carrier_price_lists list" do
      CarrierPriceList.stub!(:find).and_return(mock_carrier_price_list(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(carrier_price_lists_url)
    end
  end

end
