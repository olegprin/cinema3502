require 'rails_helper'

RSpec.describe "Messagestoadministrators", type: :request do
  describe "GET /messagestoadministrators" do
    it "works! (now write some real specs)" do
      get messagestoadministrators_path
      expect(response).to have_http_status(200)
    end
  end
end
