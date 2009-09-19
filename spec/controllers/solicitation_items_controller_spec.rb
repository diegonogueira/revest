require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SolicitationItemsController do

  def mock_solicitation_item(stubs={})
    @mock_solicitation_item ||= mock_model(SolicitationItem, stubs)
  end

  describe "GET index" do
    it "assigns all solicitation_items as @solicitation_items" do
      SolicitationItem.stub!(:find).with(:all).and_return([mock_solicitation_item])
      get :index
      assigns[:solicitation_items].should == [mock_solicitation_item]
    end
  end

  describe "GET show" do
    it "assigns the requested solicitation_item as @solicitation_item" do
      SolicitationItem.stub!(:find).with("37").and_return(mock_solicitation_item)
      get :show, :id => "37"
      assigns[:solicitation_item].should equal(mock_solicitation_item)
    end
  end

  describe "GET new" do
    it "assigns a new solicitation_item as @solicitation_item" do
      SolicitationItem.stub!(:new).and_return(mock_solicitation_item)
      get :new
      assigns[:solicitation_item].should equal(mock_solicitation_item)
    end
  end

  describe "GET edit" do
    it "assigns the requested solicitation_item as @solicitation_item" do
      SolicitationItem.stub!(:find).with("37").and_return(mock_solicitation_item)
      get :edit, :id => "37"
      assigns[:solicitation_item].should equal(mock_solicitation_item)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created solicitation_item as @solicitation_item" do
        SolicitationItem.stub!(:new).with({'these' => 'params'}).and_return(mock_solicitation_item(:save => true))
        post :create, :solicitation_item => {:these => 'params'}
        assigns[:solicitation_item].should equal(mock_solicitation_item)
      end

      it "redirects to the created solicitation_item" do
        SolicitationItem.stub!(:new).and_return(mock_solicitation_item(:save => true))
        post :create, :solicitation_item => {}
        response.should redirect_to(solicitation_item_url(mock_solicitation_item))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved solicitation_item as @solicitation_item" do
        SolicitationItem.stub!(:new).with({'these' => 'params'}).and_return(mock_solicitation_item(:save => false))
        post :create, :solicitation_item => {:these => 'params'}
        assigns[:solicitation_item].should equal(mock_solicitation_item)
      end

      it "re-renders the 'new' template" do
        SolicitationItem.stub!(:new).and_return(mock_solicitation_item(:save => false))
        post :create, :solicitation_item => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested solicitation_item" do
        SolicitationItem.should_receive(:find).with("37").and_return(mock_solicitation_item)
        mock_solicitation_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :solicitation_item => {:these => 'params'}
      end

      it "assigns the requested solicitation_item as @solicitation_item" do
        SolicitationItem.stub!(:find).and_return(mock_solicitation_item(:update_attributes => true))
        put :update, :id => "1"
        assigns[:solicitation_item].should equal(mock_solicitation_item)
      end

      it "redirects to the solicitation_item" do
        SolicitationItem.stub!(:find).and_return(mock_solicitation_item(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(solicitation_item_url(mock_solicitation_item))
      end
    end

    describe "with invalid params" do
      it "updates the requested solicitation_item" do
        SolicitationItem.should_receive(:find).with("37").and_return(mock_solicitation_item)
        mock_solicitation_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :solicitation_item => {:these => 'params'}
      end

      it "assigns the solicitation_item as @solicitation_item" do
        SolicitationItem.stub!(:find).and_return(mock_solicitation_item(:update_attributes => false))
        put :update, :id => "1"
        assigns[:solicitation_item].should equal(mock_solicitation_item)
      end

      it "re-renders the 'edit' template" do
        SolicitationItem.stub!(:find).and_return(mock_solicitation_item(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested solicitation_item" do
      SolicitationItem.should_receive(:find).with("37").and_return(mock_solicitation_item)
      mock_solicitation_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the solicitation_items list" do
      SolicitationItem.stub!(:find).and_return(mock_solicitation_item(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(solicitation_items_url)
    end
  end

end
