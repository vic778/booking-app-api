require 'rails_helper'
require 'rails_helper'

RSpec.describe "Api::V1::Authentications", type: :request do
  describe "GET /api/v1/authentications" do
    before(:each) do
      user_params = {
        name: 'Ricky',
        email: 'rickymormor1@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      }
      post '/api/v1/users/register', params: user_params
    end

    it "returns http success" do
      user_params = {
        email: 'rickymormor1@gmail.com',
        password: '123456'
      }
      post '/api/v1/auth/login', params: user_params
      expect(response).to have_http_status(:ok)
    end
  end
end
