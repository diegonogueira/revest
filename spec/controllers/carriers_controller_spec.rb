require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CarriersController do

  def mock_carrier(stubs={})
    @mock_carrier ||= mock_model(Carrier, stubs)
  end

  describe "GET index" do
    it "assigns all carriers as @carriers" do
      Carrier.stub!(:paginate).and_return([mock_carrier])
      get :index
      assigns[:carriers].should == [mock_carrier]
    end
  end

  describe "GET show" do
    it "assigns the requested carrier as @carrier" do
      Carrier.stub!(:find).with("37").and_return(mock_carrier)
      get :show, :id => "37"
      assigns[:carrier].should equal(mock_carrier)
    end
  end

  describe "GET new" do
    it "assigns a new carrier as @carrier" do
      Carrier.stub!(:new).and_return(mock_carrier)
      get :new
      assigns[:carrier].should equal(mock_carrier)
    end
  end

  describe "GET edit" do
    it "assigns the requested carrier as @carrier" do
      Carrier.stub!(:find).with("37").and_return(mock_carrier)
      get :edit, :id => "37"
      assigns[:carrier].should equal(mock_carrier)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created carrier as @carrier" do
        Carrier.stub!(:new).with({'these' => 'params'}).and_return(mock_carrier(:save => true))
        post :create, :carrier => {:these => 'params'}
        assigns[:carrier].should equal(mock_carrier)
      end

      it "redirects to the created carrier" do
        Carrier.stub!(:new).and_return(mock_carrier(:save => true))
        post :create, :carrier => {}
        response.should redirect_to(carriers_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved carrier as @carrier" do
        Carrier.stub!(:new).with({'these' => 'params'}).and_return(mock_carrier(:save => false))
        post :create, :carrier => {:these => 'params'}
        assigns[:carrier].should equal(mock_carrier)
      end

      it "re-renders the 'new' template" do
        Carrier.stub!(:new).and_return(mock_carrier(:save => false))
        post :create, :carrier => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested carrier" do
        Carrier.should_receive(:find).with("37").and_return(mock_carrier)
        mock_carrier.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :carrier => {:these => 'params'}
      end

      it "assigns the requested carrier as @carrier" do
        Carrier.stub!(:find).and_return(mock_carrier(:update_attributes => true))
        put :update, :id => "1"
        assigns[:carrier].should equal(mock_carrier)
      end

      it "redirects to the carrier" do
        Carrier.stub!(:find).and_return(mock_carrier(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(carriers_url)
      end
    end

    describe "with invalid params" do
      it "updates the requested carrier" do
        Carrier.should_receive(:find).with("37").and_return(mock_carrier)
        mock_carrier.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :carrier => {:these => 'params'}
      end

      it "assigns the carrier as @carrier" do
        Carrier.stub!(:find).and_return(mock_carrier(:update_attributes => false))
        put :update, :id => "1"
        assigns[:carrier].should equal(mock_carrier)
      end

      it "re-renders the 'edit' template" do
        Carrier.stub!(:find).and_return(mock_carrier(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested carrier" do
      Carrier.should_receive(:find).with(:first,:conditions=>{:id=>"37"}).and_return(mock_carrier)
      mock_carrier.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the carriers list" do
      Carrier.stub!(:find).and_return(mock_carrier(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(carriers_url)
    end
  end

end
