require "spec_helper"

describe MainoptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/mainoptions").should route_to("mainoptions#index")
    end

    it "routes to #new" do
      get("/mainoptions/new").should route_to("mainoptions#new")
    end

    it "routes to #show" do
      get("/mainoptions/1").should route_to("mainoptions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mainoptions/1/edit").should route_to("mainoptions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mainoptions").should route_to("mainoptions#create")
    end

    it "routes to #update" do
      put("/mainoptions/1").should route_to("mainoptions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mainoptions/1").should route_to("mainoptions#destroy", :id => "1")
    end

  end
end
