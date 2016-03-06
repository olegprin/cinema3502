require "rails_helper"

RSpec.describe AnswerfrommoderatorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/answerfrommoderators").to route_to("answerfrommoderators#index")
    end

    it "routes to #new" do
      expect(:get => "/answerfrommoderators/new").to route_to("answerfrommoderators#new")
    end

    it "routes to #show" do
      expect(:get => "/answerfrommoderators/1").to route_to("answerfrommoderators#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/answerfrommoderators/1/edit").to route_to("answerfrommoderators#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/answerfrommoderators").to route_to("answerfrommoderators#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/answerfrommoderators/1").to route_to("answerfrommoderators#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/answerfrommoderators/1").to route_to("answerfrommoderators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/answerfrommoderators/1").to route_to("answerfrommoderators#destroy", :id => "1")
    end

  end
end
