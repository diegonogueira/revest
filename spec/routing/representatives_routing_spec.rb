require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RepresentativesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "representatives", :action => "index").should == "/representatives"
    end

    it "maps #new" do
      route_for(:controller => "representatives", :action => "new").should == "/representatives/new"
    end

    it "maps #show" do
      route_for(:controller => "representatives", :action => "show", :id => "1").should == "/representatives/1"
    end

    it "maps #edit" do
      route_for(:controller => "representatives", :action => "edit", :id => "1").should == "/representatives/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "representatives", :action => "create").should == {:path => "/representatives", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "representatives", :action => "update", :id => "1").should == {:path =>"/representatives/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "representatives", :action => "destroy", :id => "1").should == {:path =>"/representatives/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/representatives").should == {:controller => "representatives", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/representatives/new").should == {:controller => "representatives", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/representatives").should == {:controller => "representatives", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/representatives/1").should == {:controller => "representatives", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/representatives/1/edit").should == {:controller => "representatives", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/representatives/1").should == {:controller => "representatives", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/representatives/1").should == {:controller => "representatives", :action => "destroy", :id => "1"}
    end
  end
end
