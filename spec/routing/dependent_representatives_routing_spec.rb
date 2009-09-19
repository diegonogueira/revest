require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DependentRepresentativesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "dependent_representatives", :action => "index").should == "/dependent_representatives"
    end

    it "maps #new" do
      route_for(:controller => "dependent_representatives", :action => "new").should == "/dependent_representatives/new"
    end

    it "maps #show" do
      route_for(:controller => "dependent_representatives", :action => "show", :id => "1").should == "/dependent_representatives/1"
    end

    it "maps #edit" do
      route_for(:controller => "dependent_representatives", :action => "edit", :id => "1").should == "/dependent_representatives/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "dependent_representatives", :action => "create").should == {:path => "/dependent_representatives", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "dependent_representatives", :action => "update", :id => "1").should == {:path =>"/dependent_representatives/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "dependent_representatives", :action => "destroy", :id => "1").should == {:path =>"/dependent_representatives/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/dependent_representatives").should == {:controller => "dependent_representatives", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/dependent_representatives/new").should == {:controller => "dependent_representatives", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/dependent_representatives").should == {:controller => "dependent_representatives", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/dependent_representatives/1").should == {:controller => "dependent_representatives", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/dependent_representatives/1/edit").should == {:controller => "dependent_representatives", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/dependent_representatives/1").should == {:controller => "dependent_representatives", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/dependent_representatives/1").should == {:controller => "dependent_representatives", :action => "destroy", :id => "1"}
    end
  end
end
