require 'rails_helper'

RSpec.describe "Api::V1::Authentications", type: :request do
  describe "GET /api/v1/authentications" do
    before(:each) do
      @user = FactoryBot.create(:user)

      post '/api/v1/auth/login', params: {
        email: @user.email,
        password: @user.password
      }
      @token = JSON.parse(response.body)['auth_token']

    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
      end

    it "returns the user's auth_token" do
      expect(JSON.parse(response.body)['auth_token']).to_not be_nil
      end

    it "returns the user's email" do
      expect(JSON.parse(response.body)['email']).to_not be_nil
      end

    it "returns the user's name" do
      expect(JSON.parse(response.body)['name']).to_not be_nil
      end
  end
end
