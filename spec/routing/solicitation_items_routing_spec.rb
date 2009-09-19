require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SolicitationItemsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "solicitation_items", :action => "index").should == "/solicitation_items"
    end

    it "maps #new" do
      route_for(:controller => "solicitation_items", :action => "new").should == "/solicitation_items/new"
    end

    it "maps #show" do
      route_for(:controller => "solicitation_items", :action => "show", :id => "1").should == "/solicitation_items/1"
    end

    it "maps #edit" do
      route_for(:controller => "solicitation_items", :action => "edit", :id => "1").should == "/solicitation_items/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "solicitation_items", :action => "create").should == {:path => "/solicitation_items", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "solicitation_items", :action => "update", :id => "1").should == {:path =>"/solicitation_items/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "solicitation_items", :action => "destroy", :id => "1").should == {:path =>"/solicitation_items/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/solicitation_items").should == {:controller => "solicitation_items", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/solicitation_items/new").should == {:controller => "solicitation_items", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/solicitation_items").should == {:controller => "solicitation_items", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/solicitation_items/1").should == {:controller => "solicitation_items", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/solicitation_items/1/edit").should == {:controller => "solicitation_items", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/solicitation_items/1").should == {:controller => "solicitation_items", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/solicitation_items/1").should == {:controller => "solicitation_items", :action => "destroy", :id => "1"}
    end
  end
end
