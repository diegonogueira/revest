require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CarriersController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "carriers", :action => "index").should == "/carriers"
    end

    it "maps #new" do
      route_for(:controller => "carriers", :action => "new").should == "/carriers/new"
    end

    it "maps #show" do
      route_for(:controller => "carriers", :action => "show", :id => "1").should == "/carriers/1"
    end

    it "maps #edit" do
      route_for(:controller => "carriers", :action => "edit", :id => "1").should == "/carriers/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "carriers", :action => "create").should == {:path => "/carriers", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "carriers", :action => "update", :id => "1").should == {:path =>"/carriers/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "carriers", :action => "destroy", :id => "1").should == {:path =>"/carriers/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/carriers").should == {:controller => "carriers", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/carriers/new").should == {:controller => "carriers", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/carriers").should == {:controller => "carriers", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/carriers/1").should == {:controller => "carriers", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/carriers/1/edit").should == {:controller => "carriers", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/carriers/1").should == {:controller => "carriers", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/carriers/1").should == {:controller => "carriers", :action => "destroy", :id => "1"}
    end
  end
end
