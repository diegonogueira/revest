require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RepresentativesController do

  def mock_representative(stubs={})
    @mock_representative ||= mock_model(Representative, stubs)
  end

  describe "GET index" do
    it "assigns all representatives as @representatives" do
      Representative.stub!(:find).with(:all).and_return([mock_representative])
      get :index
      assigns[:representatives].should == [mock_representative]
    end
  end

  describe "GET show" do
    it "assigns the requested representative as @representative" do
      Representative.stub!(:find).with("37").and_return(mock_representative)
      get :show, :id => "37"
      assigns[:representative].should equal(mock_representative)
    end
  end

  describe "GET new" do
    it "assigns a new representative as @representative" do
      Representative.stub!(:new).and_return(mock_representative)
      get :new
      assigns[:representative].should equal(mock_representative)
    end
  end

  describe "GET edit" do
    it "assigns the requested representative as @representative" do
      Representative.stub!(:find).with("37").and_return(mock_representative)
      get :edit, :id => "37"
      assigns[:representative].should equal(mock_representative)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created representative as @representative" do
        Representative.stub!(:new).with({'these' => 'params'}).and_return(mock_representative(:save => true))
        post :create, :representative => {:these => 'params'}
        assigns[:representative].should equal(mock_representative)
      end

      it "redirects to the created representative" do
        Representative.stub!(:new).and_return(mock_representative(:save => true))
        post :create, :representative => {}
        response.should redirect_to(representative_url(mock_representative))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved representative as @representative" do
        Representative.stub!(:new).with({'these' => 'params'}).and_return(mock_representative(:save => false))
        post :create, :representative => {:these => 'params'}
        assigns[:representative].should equal(mock_representative)
      end

      it "re-renders the 'new' template" do
        Representative.stub!(:new).and_return(mock_representative(:save => false))
        post :create, :representative => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested representative" do
        Representative.should_receive(:find).with("37").and_return(mock_representative)
        mock_representative.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :representative => {:these => 'params'}
      end

      it "assigns the requested representative as @representative" do
        Representative.stub!(:find).and_return(mock_representative(:update_attributes => true))
        put :update, :id => "1"
        assigns[:representative].should equal(mock_representative)
      end

      it "redirects to the representative" do
        Representative.stub!(:find).and_return(mock_representative(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(representative_url(mock_representative))
      end
    end

    describe "with invalid params" do
      it "updates the requested representative" do
        Representative.should_receive(:find).with("37").and_return(mock_representative)
        mock_representative.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :representative => {:these => 'params'}
      end

      it "assigns the representative as @representative" do
        Representative.stub!(:find).and_return(mock_representative(:update_attributes => false))
        put :update, :id => "1"
        assigns[:representative].should equal(mock_representative)
      end

      it "re-renders the 'edit' template" do
        Representative.stub!(:find).and_return(mock_representative(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested representative" do
      Representative.should_receive(:find).with("37").and_return(mock_representative)
      mock_representative.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the representatives list" do
      Representative.stub!(:find).and_return(mock_representative(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(representatives_url)
    end
  end

end
