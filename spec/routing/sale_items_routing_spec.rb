require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SaleItemsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "sale_items", :action => "index").should == "/sale_items"
    end

    it "maps #new" do
      route_for(:controller => "sale_items", :action => "new").should == "/sale_items/new"
    end

    it "maps #show" do
      route_for(:controller => "sale_items", :action => "show", :id => "1").should == "/sale_items/1"
    end

    it "maps #edit" do
      route_for(:controller => "sale_items", :action => "edit", :id => "1").should == "/sale_items/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "sale_items", :action => "create").should == {:path => "/sale_items", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "sale_items", :action => "update", :id => "1").should == {:path =>"/sale_items/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "sale_items", :action => "destroy", :id => "1").should == {:path =>"/sale_items/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/sale_items").should == {:controller => "sale_items", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/sale_items/new").should == {:controller => "sale_items", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/sale_items").should == {:controller => "sale_items", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/sale_items/1").should == {:controller => "sale_items", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/sale_items/1/edit").should == {:controller => "sale_items", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/sale_items/1").should == {:controller => "sale_items", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/sale_items/1").should == {:controller => "sale_items", :action => "destroy", :id => "1"}
    end
  end
end
