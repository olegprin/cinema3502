require "rails_helper"

RSpec.describe MessagestoadministratorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/messagestoadministrators").to route_to("messagestoadministrators#index")
    end

    it "routes to #new" do
      expect(:get => "/messagestoadministrators/new").to route_to("messagestoadministrators#new")
    end

    it "routes to #show" do
      expect(:get => "/messagestoadministrators/1").to route_to("messagestoadministrators#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/messagestoadministrators/1/edit").to route_to("messagestoadministrators#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/messagestoadministrators").to route_to("messagestoadministrators#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/messagestoadministrators/1").to route_to("messagestoadministrators#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/messagestoadministrators/1").to route_to("messagestoadministrators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/messagestoadministrators/1").to route_to("messagestoadministrators#destroy", :id => "1")
    end

  end
end
