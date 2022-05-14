require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  it 'it create a new user' do
    user_params = {
      name: 'Victor',
      email: 'barhvictor@gmail.com',
      password: '123456',
      password_confirmation: '123456'
    }
    post '/api/v1/users/register', params: user_params
    expect(response).to have_http_status(:created)
  end

  it 'it should return error when create a new user' do
    user_params = {
      name: 'Victor',
      email: '',
      password: '123456',
      password_confirmation: '123456'
    }
    post '/api/v1/users/register', params: user_params
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it "it should update a user" do
    user = FactoryBot.create(:user)
    user_params = {
      name: 'Barh',
      password: '123456',
      password_confirmation: '123456'
    }
    put "/api/v1/users/#{user.id}", params: user_params
    expect(response).to have_http_status(:ok)
  end

  it "it should return error when update a user" do
    user = FactoryBot.create(:user)
    user_params = {
      name: 'Barh',
      password: '123456',
      password_confirmation: ''
    }
    put "/api/v1/users/#{user.id}", params: user_params
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
