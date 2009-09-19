require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SolicitationsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "solicitations", :action => "index").should == "/solicitations"
    end

    it "maps #new" do
      route_for(:controller => "solicitations", :action => "new").should == "/solicitations/new"
    end

    it "maps #show" do
      route_for(:controller => "solicitations", :action => "show", :id => "1").should == "/solicitations/1"
    end

    it "maps #edit" do
      route_for(:controller => "solicitations", :action => "edit", :id => "1").should == "/solicitations/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "solicitations", :action => "create").should == {:path => "/solicitations", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "solicitations", :action => "update", :id => "1").should == {:path =>"/solicitations/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "solicitations", :action => "destroy", :id => "1").should == {:path =>"/solicitations/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/solicitations").should == {:controller => "solicitations", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/solicitations/new").should == {:controller => "solicitations", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/solicitations").should == {:controller => "solicitations", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/solicitations/1").should == {:controller => "solicitations", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/solicitations/1/edit").should == {:controller => "solicitations", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/solicitations/1").should == {:controller => "solicitations", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/solicitations/1").should == {:controller => "solicitations", :action => "destroy", :id => "1"}
    end
  end
end
