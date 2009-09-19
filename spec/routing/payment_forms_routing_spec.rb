require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PaymentFormsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "payment_forms", :action => "index").should == "/payment_forms"
    end

    it "maps #new" do
      route_for(:controller => "payment_forms", :action => "new").should == "/payment_forms/new"
    end

    it "maps #show" do
      route_for(:controller => "payment_forms", :action => "show", :id => "1").should == "/payment_forms/1"
    end

    it "maps #edit" do
      route_for(:controller => "payment_forms", :action => "edit", :id => "1").should == "/payment_forms/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "payment_forms", :action => "create").should == {:path => "/payment_forms", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "payment_forms", :action => "update", :id => "1").should == {:path =>"/payment_forms/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "payment_forms", :action => "destroy", :id => "1").should == {:path =>"/payment_forms/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/payment_forms").should == {:controller => "payment_forms", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/payment_forms/new").should == {:controller => "payment_forms", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/payment_forms").should == {:controller => "payment_forms", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/payment_forms/1").should == {:controller => "payment_forms", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/payment_forms/1/edit").should == {:controller => "payment_forms", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/payment_forms/1").should == {:controller => "payment_forms", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/payment_forms/1").should == {:controller => "payment_forms", :action => "destroy", :id => "1"}
    end
  end
end
