require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SolicitationsController do

  def mock_solicitation(stubs={})
    @mock_solicitation ||= mock_model(Solicitation, stubs)
  end

  describe "GET index" do
    it "assigns all solicitations as @solicitations" do
      Solicitation.stub!(:find).with(:all).and_return([mock_solicitation])
      get :index
      assigns[:solicitations].should == [mock_solicitation]
    end
  end

  describe "GET show" do
    it "assigns the requested solicitation as @solicitation" do
      Solicitation.stub!(:find).with("37").and_return(mock_solicitation)
      get :show, :id => "37"
      assigns[:solicitation].should equal(mock_solicitation)
    end
  end

  describe "GET new" do
    it "assigns a new solicitation as @solicitation" do
      Solicitation.stub!(:new).and_return(mock_solicitation)
      get :new
      assigns[:solicitation].should equal(mock_solicitation)
    end
  end

  describe "GET edit" do
    it "assigns the requested solicitation as @solicitation" do
      Solicitation.stub!(:find).with("37").and_return(mock_solicitation)
      get :edit, :id => "37"
      assigns[:solicitation].should equal(mock_solicitation)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created solicitation as @solicitation" do
        Solicitation.stub!(:new).with({'these' => 'params'}).and_return(mock_solicitation(:save => true))
        post :create, :solicitation => {:these => 'params'}
        assigns[:solicitation].should equal(mock_solicitation)
      end

      it "redirects to the created solicitation" do
        Solicitation.stub!(:new).and_return(mock_solicitation(:save => true))
        post :create, :solicitation => {}
        response.should redirect_to(solicitation_url(mock_solicitation))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved solicitation as @solicitation" do
        Solicitation.stub!(:new).with({'these' => 'params'}).and_return(mock_solicitation(:save => false))
        post :create, :solicitation => {:these => 'params'}
        assigns[:solicitation].should equal(mock_solicitation)
      end

      it "re-renders the 'new' template" do
        Solicitation.stub!(:new).and_return(mock_solicitation(:save => false))
        post :create, :solicitation => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested solicitation" do
        Solicitation.should_receive(:find).with("37").and_return(mock_solicitation)
        mock_solicitation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :solicitation => {:these => 'params'}
      end

      it "assigns the requested solicitation as @solicitation" do
        Solicitation.stub!(:find).and_return(mock_solicitation(:update_attributes => true))
        put :update, :id => "1"
        assigns[:solicitation].should equal(mock_solicitation)
      end

      it "redirects to the solicitation" do
        Solicitation.stub!(:find).and_return(mock_solicitation(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(solicitation_url(mock_solicitation))
      end
    end

    describe "with invalid params" do
      it "updates the requested solicitation" do
        Solicitation.should_receive(:find).with("37").and_return(mock_solicitation)
        mock_solicitation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :solicitation => {:these => 'params'}
      end

      it "assigns the solicitation as @solicitation" do
        Solicitation.stub!(:find).and_return(mock_solicitation(:update_attributes => false))
        put :update, :id => "1"
        assigns[:solicitation].should equal(mock_solicitation)
      end

      it "re-renders the 'edit' template" do
        Solicitation.stub!(:find).and_return(mock_solicitation(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested solicitation" do
      Solicitation.should_receive(:find).with("37").and_return(mock_solicitation)
      mock_solicitation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the solicitations list" do
      Solicitation.stub!(:find).and_return(mock_solicitation(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(solicitations_url)
    end
  end

end
