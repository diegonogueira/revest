require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PaymentFormsController do

  def mock_payment_form(stubs={})
    @mock_payment_form ||= mock_model(PaymentForm, stubs)
  end

  describe "GET index" do
    it "assigns all payment_forms as @payment_forms" do
      PaymentForm.stub!(:paginate).and_return([mock_payment_form])
      get :index
      assigns[:payment_forms].should == [mock_payment_form]
    end
  end

  describe "GET show" do
    it "assigns the requested payment_form as @payment_form" do
      PaymentForm.stub!(:find).with("37").and_return(mock_payment_form)
      get :show, :id => "37"
      assigns[:payment_form].should equal(mock_payment_form)
    end
  end

  describe "GET new" do
    it "assigns a new payment_form as @payment_form" do
      PaymentForm.stub!(:new).and_return(mock_payment_form)
      get :new
      assigns[:payment_form].should equal(mock_payment_form)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_form as @payment_form" do
      PaymentForm.stub!(:find).with("37").and_return(mock_payment_form)
      get :edit, :id => "37"
      assigns[:payment_form].should equal(mock_payment_form)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created payment_form as @payment_form" do
        PaymentForm.stub!(:new).with({'these' => 'params'}).and_return(mock_payment_form(:save => true))
        post :create, :payment_form => {:these => 'params'}
        assigns[:payment_form].should equal(mock_payment_form)
      end

      it "redirects to the created payment_form" do
        PaymentForm.stub!(:new).and_return(mock_payment_form(:save => true))
        post :create, :payment_form => {}
        response.should redirect_to(payment_forms_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment_form as @payment_form" do
        PaymentForm.stub!(:new).with({'these' => 'params'}).and_return(mock_payment_form(:save => false))
        post :create, :payment_form => {:these => 'params'}
        assigns[:payment_form].should equal(mock_payment_form)
      end

      it "re-renders the 'new' template" do
        PaymentForm.stub!(:new).and_return(mock_payment_form(:save => false))
        post :create, :payment_form => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested payment_form" do
        PaymentForm.should_receive(:find).with("37").and_return(mock_payment_form)
        mock_payment_form.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_form => {:these => 'params'}
      end

      it "assigns the requested payment_form as @payment_form" do
        PaymentForm.stub!(:find).and_return(mock_payment_form(:update_attributes => true))
        put :update, :id => "1"
        assigns[:payment_form].should equal(mock_payment_form)
      end

      it "redirects to the payment_form" do
        PaymentForm.stub!(:find).and_return(mock_payment_form(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(payment_forms_url)
      end
    end

    describe "with invalid params" do
      it "updates the requested payment_form" do
        PaymentForm.should_receive(:find).with("37").and_return(mock_payment_form)
        mock_payment_form.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_form => {:these => 'params'}
      end

      it "assigns the payment_form as @payment_form" do
        PaymentForm.stub!(:find).and_return(mock_payment_form(:update_attributes => false))
        put :update, :id => "1"
        assigns[:payment_form].should equal(mock_payment_form)
      end

      it "re-renders the 'edit' template" do
        PaymentForm.stub!(:find).and_return(mock_payment_form(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested payment_form" do
      PaymentForm.should_receive(:find).with(:first,:conditions=>{:id=>"37"}).and_return(mock_payment_form)
      mock_payment_form.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the payment_forms list" do
      PaymentForm.stub!(:find).and_return(mock_payment_form(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(payment_forms_url)
    end
  end

end
