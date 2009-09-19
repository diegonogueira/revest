require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PriceListsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "price_lists", :action => "index").should == "/price_lists"
    end

    it "maps #new" do
      route_for(:controller => "price_lists", :action => "new").should == "/price_lists/new"
    end

    it "maps #show" do
      route_for(:controller => "price_lists", :action => "show", :id => "1").should == "/price_lists/1"
    end

    it "maps #edit" do
      route_for(:controller => "price_lists", :action => "edit", :id => "1").should == "/price_lists/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "price_lists", :action => "create").should == {:path => "/price_lists", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "price_lists", :action => "update", :id => "1").should == {:path =>"/price_lists/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "price_lists", :action => "destroy", :id => "1").should == {:path =>"/price_lists/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/price_lists").should == {:controller => "price_lists", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/price_lists/new").should == {:controller => "price_lists", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/price_lists").should == {:controller => "price_lists", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/price_lists/1").should == {:controller => "price_lists", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/price_lists/1/edit").should == {:controller => "price_lists", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/price_lists/1").should == {:controller => "price_lists", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/price_lists/1").should == {:controller => "price_lists", :action => "destroy", :id => "1"}
    end
  end
end
