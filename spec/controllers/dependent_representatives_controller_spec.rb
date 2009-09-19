require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DependentRepresentativesController do

  def mock_dependent_representative(stubs={})
    @mock_dependent_representative ||= mock_model(DependentRepresentative, stubs)
  end

  describe "GET index" do
    it "assigns all dependent_representatives as @dependent_representatives" do
      DependentRepresentative.stub!(:find).with(:all).and_return([mock_dependent_representative])
      get :index
      assigns[:dependent_representatives].should == [mock_dependent_representative]
    end
  end

  describe "GET show" do
    it "assigns the requested dependent_representative as @dependent_representative" do
      DependentRepresentative.stub!(:find).with("37").and_return(mock_dependent_representative)
      get :show, :id => "37"
      assigns[:dependent_representative].should equal(mock_dependent_representative)
    end
  end

  describe "GET new" do
    it "assigns a new dependent_representative as @dependent_representative" do
      DependentRepresentative.stub!(:new).and_return(mock_dependent_representative)
      get :new
      assigns[:dependent_representative].should equal(mock_dependent_representative)
    end
  end

  describe "GET edit" do
    it "assigns the requested dependent_representative as @dependent_representative" do
      DependentRepresentative.stub!(:find).with("37").and_return(mock_dependent_representative)
      get :edit, :id => "37"
      assigns[:dependent_representative].should equal(mock_dependent_representative)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created dependent_representative as @dependent_representative" do
        DependentRepresentative.stub!(:new).with({'these' => 'params'}).and_return(mock_dependent_representative(:save => true))
        post :create, :dependent_representative => {:these => 'params'}
        assigns[:dependent_representative].should equal(mock_dependent_representative)
      end

      it "redirects to the created dependent_representative" do
        DependentRepresentative.stub!(:new).and_return(mock_dependent_representative(:save => true))
        post :create, :dependent_representative => {}
        response.should redirect_to(dependent_representative_url(mock_dependent_representative))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dependent_representative as @dependent_representative" do
        DependentRepresentative.stub!(:new).with({'these' => 'params'}).and_return(mock_dependent_representative(:save => false))
        post :create, :dependent_representative => {:these => 'params'}
        assigns[:dependent_representative].should equal(mock_dependent_representative)
      end

      it "re-renders the 'new' template" do
        DependentRepresentative.stub!(:new).and_return(mock_dependent_representative(:save => false))
        post :create, :dependent_representative => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested dependent_representative" do
        DependentRepresentative.should_receive(:find).with("37").and_return(mock_dependent_representative)
        mock_dependent_representative.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dependent_representative => {:these => 'params'}
      end

      it "assigns the requested dependent_representative as @dependent_representative" do
        DependentRepresentative.stub!(:find).and_return(mock_dependent_representative(:update_attributes => true))
        put :update, :id => "1"
        assigns[:dependent_representative].should equal(mock_dependent_representative)
      end

      it "redirects to the dependent_representative" do
        DependentRepresentative.stub!(:find).and_return(mock_dependent_representative(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(dependent_representative_url(mock_dependent_representative))
      end
    end

    describe "with invalid params" do
      it "updates the requested dependent_representative" do
        DependentRepresentative.should_receive(:find).with("37").and_return(mock_dependent_representative)
        mock_dependent_representative.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dependent_representative => {:these => 'params'}
      end

      it "assigns the dependent_representative as @dependent_representative" do
        DependentRepresentative.stub!(:find).and_return(mock_dependent_representative(:update_attributes => false))
        put :update, :id => "1"
        assigns[:dependent_representative].should equal(mock_dependent_representative)
      end

      it "re-renders the 'edit' template" do
        DependentRepresentative.stub!(:find).and_return(mock_dependent_representative(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested dependent_representative" do
      DependentRepresentative.should_receive(:find).with("37").and_return(mock_dependent_representative)
      mock_dependent_representative.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the dependent_representatives list" do
      DependentRepresentative.stub!(:find).and_return(mock_dependent_representative(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(dependent_representatives_url)
    end
  end

end
