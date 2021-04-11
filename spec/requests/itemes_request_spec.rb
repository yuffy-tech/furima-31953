require 'rails_helper'

RSpec.describe "Itemes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/itemes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/itemes/new"
      expect(response).to have_http_status(:success)
    end
  end

end
