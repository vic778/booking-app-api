require 'rails_helper'

RSpec.describe "Api::V2::Motorcyles", type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    @motorcycle = FactoryBot.create(:motorcycle, user: @user)
  end

  it "returns http success" do
    get '/api/v2/motorcyles'
    expect(response).to have_http_status(:success)
  end

  it "it should return a list of motorcycles" do
    get '/api/v2/motorcyles'
    expect(response).to have_http_status(:success)
  end
end
