require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  
  # describe "GET /api/v1/users" do
  #   it "returns http success" do
  #     get "/api/v1/users"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  
  # describe "GET /api/v1/users/:id" do
  #   it "returns http success" do
  #     get "/api/v1/users/1"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  
  describe "POST /api/v1/users/register" do
    it "returns http success" do
      post "/api/v1/users/register", params: {
          name: "Rails",
          email: "rails@", 
          password: "Railsrails",
          password_confirmation: "Railsrails"
      }
      expect(response).to have_http_status(:success)
    end
  end

  # describe "PUT /api/v1/users/:id" do
  #   it "returns http success" do
  #     put "/api/v1/users/1", params: {   
  #         name: "Rails",
  #         password: "Railsrails",
  #         password_confirmation: "Railsrails"
  #     }
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
