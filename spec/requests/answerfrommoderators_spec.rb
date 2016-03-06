require 'rails_helper'

RSpec.describe "Answerfrommoderators", type: :request do
  describe "GET /answerfrommoderators" do
    it "works! (now write some real specs)" do
      get answerfrommoderators_path
      expect(response).to have_http_status(200)
    end
  end
end
