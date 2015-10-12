require 'rails_helper'

RSpec.describe LineItemController, type: :controller do

  describe "GET #approve" do
    it "returns http success" do
      get :approve
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #cancel" do
    it "returns http success" do
      get :cancel
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #ship" do
    it "returns http success" do
      get :ship
      expect(response).to have_http_status(:success)
    end
  end

end
