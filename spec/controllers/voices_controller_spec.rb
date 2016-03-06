require 'rails_helper'

RSpec.describe VoicesController, type: :controller do

  describe "GET #increase" do
    it "returns http success" do
      get :increase
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #decrease" do
    it "returns http success" do
      get :decrease
      expect(response).to have_http_status(:success)
    end
  end

end
